// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

/*!
Technical Implementation Notes

When trying to understand the code, a good place to start is
`MainPythonInterpreter.new()`, as this will initialize the CPython runtime and
Python initialization is where most of the magic occurs.

A lot of initialization code revolves around mapping
`OxidizedPythonInterpreterConfig` members to C API calls. This functionality is
rather straightforward. There's nothing really novel or complicated here. So
we won't cover it.

# Python Memory Allocators

There exist several
[CPython APIs for memory management](https://docs.python.org/3/c-api/memory.html).
CPython defines multiple memory allocator *domains* and it is possible to
use a custom memory allocator for each using the `PyMem_SetAllocator()` API.

See the documentation in the `pyalloc` module for more on this topic.

# Module Importing

The module importing mechanisms provided by this crate are one of the
most complicated parts of the crate. This section aims to explain how it
works. But before we go into the technical details, we need an understanding
of how Python module importing works.

## High Level Python Importing Overview

A *meta path importer* is a Python object implementing
the [importlib.abc.MetaPathFinder](https://docs.python.org/3.7/library/importlib.html#importlib.abc.MetaPathFinder)
interface and is registered on [sys.meta_path](https://docs.python.org/3.7/library/sys.html#sys.meta_path).
Essentially, when the `__import__` function / `import` statement is called,
Python's importing internals traverse entities in `sys.meta_path` and
ask each *finder* to load a module. The first *meta path importer* that knows
about the module is used.

By default, Python configures 3 *meta path importers*: an importer for
built-in extension modules (`BuiltinImporter`), frozen modules
(`FrozenImporter`), and filesystem-based modules (`PathFinder`). You can
see these on a fresh Python interpreter:

```text
   $ python3.7 -c 'import sys; print(sys.meta_path)`
   [<class '_frozen_importlib.BuiltinImporter'>, <class '_frozen_importlib.FrozenImporter'>, <class '_frozen_importlib_external.PathFinder'>]
```

These types are all implemented in Python code in the Python standard
library, specifically in the `importlib._bootstrap` and
`importlib._bootstrap_external` modules.

Built-in extension modules are compiled into the Python library. These are often
extension modules required by core Python (such as the `_codecs`, `_io`, and
`_signal` modules). But it is possible for other extensions - such as those
provided by Python's standard library or 3rd party packages - to exist as
built-in extension modules as well.

For importing built-in extension modules, there's a global `PyImport_Inittab`
array containing members defining the extension/module name and a pointer to
its C initialization function. There are undocumented functions exported to
Python (such as `_imp.exec_builtin()` that allow Python code to call into C code
which knows how to e.g. instantiate these extension modules. The
`BuiltinImporter` calls into these C-backed functions to service imports of
built-in extension modules.

Frozen modules are Python modules that have their bytecode backed by memory.
There is a global `PyImport_FrozenModules` array that - like
`PyImport_Inittab` - defines module names and a pointer to bytecode data. The
`FrozenImporter` calls into undocumented C functions exported to Python to try
to service import requests for frozen modules.

Path-based module loading via the `PathFinder` meta path importer is what
most people are likely familiar with. It uses `sys.path` and a handful of
other settings to traverse filesystem paths, looking for modules in those
locations. e.g. if `sys.path` contains
`['', '/usr/lib/python3.7', '/usr/lib/python3.7/lib-dynload', '/usr/lib/python3/dist-packages']`,
`PathFinder` will look for `.py`, `.pyc`, and compiled extension modules
(`.so`, `.pyd`, etc) in each of those paths to service an import request.
Path-based module loading is a complicated beast, as it deals with all
kinds of complexity like caching bytecode `.pyc` files, differentiating
between Python modules and extension modules, namespace packages, finding
search locations in registry entries, etc. Altogether, there are 1500+ lines
constituting path-based importing logic in `importlib._bootstrap_external`!

## Default Initialization of Python Importing Mechanism

CPython's internals go through a convoluted series of steps to initialize
the importing mechanism. This is because there's a bit of chicken-and-egg
scenario going on. The *meta path importers* are implemented as Python
modules using Python source code (`importlib._bootstrap` and
`importlib._bootstrap_external`). But in order to execute Python code you
need an initialized Python interpreter. And in order to execute a Python
module you need to import it. And how do you do any of this if the importing
functionality is implemented as Python source code and as a module?!

A few tricks are employed.

At Python build time, the source code for `importlib._bootstrap` and
`importlib._bootstrap_external` are compiled into bytecode. This bytecode is
made available to the global `PyImport_FrozenModules` array as the
`_frozen_importlib` and `_frozen_importlib_external` module names,
respectively. This means the bytecode is available for Python to load
from memory and the original `.py` files are not needed.

During interpreter initialization, Python initializes some special
built-in extension modules using its internal import mechanism APIs. These
bypass the Python-based APIs like `__import__`. This limited set of
modules includes `_imp` and `sys`, which are both completely implemented in
C.

During initialization, the interpreter also knows to explicitly look for
and load the `_frozen_importlib` module from its frozen bytecode. It creates
a new module object by hand without going through the normal import mechanism.
It then calls the `_install()` function in the loaded module. This function
executes Python code on the partially bootstrapped Python interpreter which
culminates with `BuiltinImporter` and `FrozenImporter` being registered on
`sys.meta_path`. At this point, the interpreter can import compiled
built-in extension modules and frozen modules. Subsequent interpreter
initialization henceforth uses the initialized importing mechanism to
import modules via normal import means.

Later during interpreter initialization, the `_frozen_importlib_external`
frozen module is loaded from bytecode and its `_install()` is also called.
This self-installation adds `PathFinder` to `sys.meta_path`. At this point,
modules can be imported from the filesystem. This includes `.py` based modules
from the Python standard library as well as any 3rd party modules.

Interpreter initialization continues on to do other things, such as initialize
signal handlers, initialize the filesystem encoding, set up the `sys.std*`
streams, etc. This involves importing various `.py` backed modules (from the
filesystem). Eventually interpreter initialization is complete and the
interpreter is ready to execute the user's Python code!

## Our Importing Mechanism

We use the multi-phase initialization mechanism provided by CPython 3.8+
(PEP-587) to import `oxidized_importer` and inject its `OxidizedFinder`
onto `sys.meta_path` during interpreter initialization.

Essentially:

1. Add `oxidized_importer` to `PyImport_Inittab` so it can be serviced by
   `BuiltinImporter`.
2. Enable multi-phase initialization by setting `PyConfig._init_main = 0`.
3. Call `Py_InitializeFromConfig()` to initialize Python up to the point
   where `.py` based modules need to be loaded.
4. Construct an `OxidizedFinder` and install it on `sys.meta_path`. This entails
   loading resources data, indexing built-ins and frozen modules, and clearing out
   `sys.met_path` of the default meta path importers.
5. Call `_Py_InitializeMain()` to finish Python initialization. `OxidizedFinder` is
   able to service Python standard library imports.
6. Clear out `sys.meta_path` and `sys.path_hooks` from unwanted changes made as part
   of initializing "external" importers.

By injecting `OxidizedFinder` onto `sys.meta_path[0]`, we effectively make it the
highest priority importer. And if it has indexed everything needed as part of
Python interpreter initialization, it essentially preempts the other standard
library importers from doing anything.

*/
