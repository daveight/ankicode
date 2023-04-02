.. py:currentmodule:: starlark_pyoxidizer

===============
Technical Notes
===============

CPython Initialization
======================

Most code lives in ``pylifecycle.c``.

Call tree with Python 3.7::

    ``Py_Initialize()``
      ``Py_InitializeEx()``
        ``_Py_InitializeFromConfig(_PyCoreConfig config)``
          ``_Py_InitializeCore(PyInterpreterState, _PyCoreConfig)``
            Sets up allocators.
            ``_Py_InitializeCore_impl(PyInterpreterState, _PyCoreConfig)``
              Does most of the initialization.
              Runtime, new interpreter state, thread state, GIL, built-in types,
              Initializes sys module and sets up sys.modules.
              Initializes builtins module.
              ``_PyImport_Init()``
                Copies ``interp->builtins`` to ``interp->builtins_copy``.
              ``_PyImportHooks_Init()``
                Sets up ``sys.meta_path``, ``sys.path_importer_cache``,
                ``sys.path_hooks`` to empty data structures.
              ``initimport()``
                ``PyImport_ImportFrozenModule("_frozen_importlib")``
                ``PyImport_AddModule("_frozen_importlib")``
                ``interp->importlib = importlib``
                ``interp->import_func = interp->builtins.__import__``
                ``PyInit__imp()``
                  Initializes ``_imp`` module, which is implemented in C.
                ``sys.modules["_imp"} = imp``
                ``importlib._install(sys, _imp)``
                ``_PyImportZip_Init()``

          ``_Py_InitializeMainInterpreter(interp, _PyMainInterpreterConfig)``
            ``_PySys_EndInit()``
              ``sys.path = XXX``
              ``sys.executable = XXX``
              ``sys.prefix = XXX``
              ``sys.base_prefix = XXX``
              ``sys.exec_prefix = XXX``
              ``sys.base_exec_prefix = XXX``
              ``sys.argv = XXX``
              ``sys.warnoptions = XXX``
              ``sys._xoptions = XXX``
              ``sys.flags = XXX``
              ``sys.dont_write_bytecode = XXX``
            ``initexternalimport()``
              ``interp->importlib._install_external_importers()``
            ``initfsencoding()``
              ``_PyCodec_Lookup(Py_FilesystemDefaultEncoding)``
                ``_PyCodecRegistry_Init()``
                  ``interp->codec_search_path = []``
                  ``interp->codec_search_cache = {}``
                  ``interp->codec_error_registry = {}``
                  # This is the first non-frozen import during startup.
                  ``PyImport_ImportModuleNoBlock("encodings")``
                ``interp->codec_search_cache[codec_name]``
                ``for p in interp->codec_search_path: p[codec_name]``
            ``initsigs()``
            ``add_main_module()``
              ``PyImport_AddModule("__main__")``
            ``init_sys_streams()``
              ``PyImport_ImportModule("encodings.utf_8")``
              ``PyImport_ImportModule("encodings.latin_1")``
              ``PyImport_ImportModule("io")``
              Consults ``PYTHONIOENCODING`` and gets encoding and error mode.
              Sets up ``sys.__stdin__``, ``sys.__stdout__``, ``sys.__stderr__``.
            Sets warning options.
            Sets ``_PyRuntime.initialized``, which is what ``Py_IsInitialized()``
            returns.
            ``initsite()``
              ``PyImport_ImportModule("site")``

CPython Importing Mechanism
===========================

``Lib/importlib`` defines importing mechanisms and is 100% Python.

``Programs/_freeze_importlib.c`` is a program that takes a path to an input
``.py`` file and path to output ``.h`` file. It initializes a Python interpreter
and compiles the ``.py`` file to marshalled bytecode. It writes out a ``.h``
file with an inline ``const unsigned char _Py_M__importlib`` array containing
bytecode.

``Lib/importlib/_bootstrap_external.py`` compiled to
``Python/importlib_external.h`` with ``_Py_M__importlib_external[]``.

``Lib/importlib/_bootstrap.py`` compiled to
``Python/importlib.h`` with ``_Py_M__importlib[]``.

``Python/frozen.c`` has ``_PyImport_FrozenModules[]`` effectively mapping
``_frozen_importlib`` to ``importlib._bootstrap`` and
``_frozen_importlib_external`` to ``importlib._bootstrap_external``.

``initimport()`` calls ``PyImport_ImportFrozenModule("_frozen_importlib")``,
effectively ``import importlib._bootstrap``. Module import doesn't appear
to have meaningful side-effects.

``importlib._bootstrap.__import__`` is installed as ``interp->import_func``.

C implemented ``_imp`` module is initialized.

``importlib._bootstrap._install(sys, _imp`` is called. Calls
``_setup(sys, _imp)`` and adds ``BuiltinImporter`` and ``FrozenImporter``
to ``sys.meta_path``.

``_setup()`` defines globals ``_imp`` and ``sys``. Populates ``__name__``,
``__loader__``, ``__package__``, ``__spec__``, ``__path__``, ``__file__``,
``__cached__`` on all ``sys.modules`` entries. Also loads builtins
``_thread``, ``_warnings``, and ``_weakref``.

Later during interpreter initialization, ``initexternal()`` effectively calls
``importlib._bootstrap._install_external_importers()``. This runs
``import _frozen_importlib_external``, which is effectively
``import importlib._bootstrap_external``. This module handle is aliased to
``importlib._bootstrap._bootstrap_external``.

``importlib._bootstrap_external`` import doesn't appear to have significant
side-effects.

``importlib._bootstrap_external._install()`` is called with a reference to
``importlib._bootstrap``. ``_setup()`` is called.

``importlib._bootstrap._setup()`` imports builtins ``_io``, ``_warnings``,
``_builtins``, ``marshal``. Either ``posix`` or ``nt`` imported depending
on OS. Various module-level attributes set defining run-time environment.
This includes ``_winreg``. ``SOURCE_SUFFIXES`` and ``EXTENSION_SUFFIXES``
are updated accordingly.

``importlib._bootstrap._get_supported_file_loaders()`` returns various
loaders. ``ExtensionFileLoader`` configured from ``_imp.extension_suffixes()``.
``SourceFileLoader`` configured from ``SOURCE_SUFFIXES``.
``SourcelessFileLoader`` configured from ``BYTECODE_SUFFIXES``.

``FileFinder.path_hook()`` called with all loaders and result added to
``sys.path_hooks``. ``PathFinder`` added to ``sys.meta_path``.

``sys.modules`` After Interpreter Init
======================================

============================== ========== ================================
Module                         Type       Source
============================== ========== ================================
``__main__``                              ``add_main_module()``
``_abc``                       builtin    ``abc``
``_codecs``                    builtin    ``initfsencoding()``
``_frozen_importlib``          frozen     ``initimport()``
``_frozen_importlib_external`` frozen     ``initexternal()``
``_imp``                       builtin    ``initimport()``
``_io``                        builtin    ``importlib._bootstrap._setup()``
``_signal``                    builtin    ``initsigs()``
``_thread``                    builtin    ``importlib._bootstrap._setup()``
``_warnings``                  builtin    ``importlib._bootstrap._setup()``
``_weakref``                   builtin    ``importlib._bootstrap._setup()``
``_winreg``                    builtin    ``importlib._bootstrap._setup()``
``abc``                        py
``builtins``                   builtin    ``_Py_InitializeCore_impl()``
``codecs``                     py         ``encodings`` via ``initfsencoding()``
``encodings``                  py         ``initfsencoding()``
``encodings.aliases``          py         ``encodings``
``encodings.latin_1``          py         ``init_sys_streams()``
``encodings.utf_8``            py         ``init_sys_streams()`` + ``initfsencoding()``
``io``                         py         ``init_sys_streams()``
``marshal``                    builtin    ``importlib._bootstrap._setup()``
``nt``                         builtin    ``importlib._bootstrap._setup()``
``posix``                      builtin    ``importlib._bootstrap._setup()``
``readline``                   builtin
``sys``                        builtin    ``_Py_InitializeCore_impl()``
``zipimport``                  builtin    ``initimport()``
============================== ========== ================================

Modules Imported by ``site.py``
===============================

``_collections_abc``
``_sitebuiltins``
``_stat``
``atexit``
``genericpath``
``os``
``os.path``
``posixpath``
``rlcompleter``
``site``
``stat``

Random Notes
============

Frozen importer iterates an array looking for module names. On each item, it
calls ``_PyUnicode_EqualToASCIIString()``, which verifies the search name is
ASCII. Performing an O(n) scan for every frozen module if there are a large
number of frozen modules could contribute performance overhead. A better frozen
importer would use a map/hash/dict for lookups. This //may// require CPython
API breakages, as the ``PyImport_FrozenModules`` data structure is documented
as part of the public API and its value could be updated dynamically at
run-time.

``importlib._bootstrap`` cannot call ``import`` because the global import
hook isn't registered until after ``initimport()``.

``importlib._bootstrap_external`` is the best place to monkeypatch because
of the limited run-time functionality available during ``importlib._bootstrap``.

It's a bit wonky that ``Py_Initialize()`` will import modules from the
standard library and it doesn't appear possible to disable this. If
``site.py`` is disabled, non-extension builtins are limited to
``codecs``, ``encodings``, ``abc``, and whatever ``encodings.*`` modules
are needed by ``initfsencoding()`` and ``init_sys_streams()``.

An attempt was made to freeze the set of standard library modules loaded
during initialization. However, the built-in extension importer doesn't
set all of the module attributes that are expected of the modules system.
The ``from . import aliases`` in ``encodings/__init__.py`` is confused
without these attributes. And relative imports seemed to have issues as
well. One would think it would be possible to run an embedded interpreter
with all standard library modules frozen, but this doesn't work.

Desired Changes from Python to Aid PyOxidizer
=============================================

As part of implementing PyOxidizer, we've encountered numerous shortcomings
in Python that have made implementation more difficult. This section attempts
to capture those along with our desired outcomes.

General Lack of Clear Specifications
------------------------------------

PyOxidizer has had to implement a lot of low-level functionality, notably
around interpreter initialization and module/resource importing. We have
also had to reinvent aspects of packaging so it can be performed in Rust.

Various Python functionality is not defined in specifications. Rather, it
is defined by PEPs plus implementations in code. And when there are PEPs,
often there isn't a single PEP outlining the clear current state of the
world: many PEPs are stated like *builds on top of PEP XYZ*. Often the
only canonical source of how something works is the implementation in
code. And when there are questions for clarification, it isn't clear whether
code or a PEP is wrong because oftentimes there isn't a single PEP that
is the canonical source of truth.

It would be highly preferred for Python to publish clear specifications
for how various mechanisms work. A PEP would be a diff to a specification
(possibly creating a new specification) and a discussion around it. That
way there would be a clear specification that can be consulted as the
source of truth for how things should behave.

``__file__`` Ambiguity
----------------------

It isn't clear whether ``__file__`` is actually required and what all
is derived from existence of ``__file__``. It also isn't clear what
``__file__`` should be set to if it wouldn't be a concrete filesystem
path. Can ``__file__`` be virtual? Can it refer to a binary/archive
containing the module?

Semantics of ``__file__`` need more clarification.

``importlib.metadata`` Documentation Deficiencies
-------------------------------------------------

See https://bugs.python.org/issue38594.

``importlib`` Resources Directory Ambiguity
-------------------------------------------

See https://bugs.python.org/issue36128,
https://gitlab.com/python-devs/importlib_resources/issues/58,
and https://gitlab.com/python-devs/importlib_resources/-/issues/90.

Standardizing a Python Distribution Format
------------------------------------------

PyOxidizer consumes Python distributions and repackages them. e.g. it
takes an archive containing a Python executable, standard library,
support libraries, etc and transforms them into new binaries or
distributable artifacts.

There is no standard for representing a Python distribution. This is
something that PyOxidizer has had to invent itself via the
``python-build-standalone`` project and its ``PYTHON.json`` files.

Should Python have a standardized way of describing Python distribution
archives and should CPython distribute said distributions, it would make
PyOxidizer largely agnostic of the distributor flavor being consumed
and allow PyOxidizer (and other Python packaging tools) to more easily
target other distribution flavors. e.g. you could swap out CPython for
PyPy and tooling largely wouldn't care.

Ability to Install Meta Path Importers Before ``Py_Initialize()``
-----------------------------------------------------------------

``Py_Initialize()`` will import some standard library modules during
its execution. It does so using the default meta path importers available
to the distribution. This means that standard library modules must come
from the filesystem (``PathImporter``), frozen modules, built-in extension
modules, or zip files (via ``PathImporter``).

This restriction prevents importing the entirety of the standard library
from the binary containing Python, in effect preventing the use of
self-contained executables. PyOxidizer works around this by patching
the ``importlib._bootstrap`` and ``importlib._bootstrap_external`` source
code, compiling that to bytecode, and making said bytecode available as
a frozen module. The patched code (which runs as part of ``Py_Initialize()``)
installs a ``sys.meta_path`` importer which imports modules from memory.
This solution is extremely hacky, but is necessary to achieve single file
executables with all imports serviced from memory.

In order for this to work, PyOxidizer needs a copy of these ``importlib``
modules so it can patch them and compile them to bytecode. This is
problematic in some cases because e.g. the Windows embeddable Python
distributions ship only the bytecode of these modules in a ``pythonXY.zip``
file. So PyOxidizer needs to find the source code from another location
when consuming these distributions.

But patching the ``importlib`` bootstrap modules is hacky itself. It would
be better if PyOxidizer didn't need to do this at all. This could be
achieved by splitting up the interpreter initialization APIs to give embedding
applications the opportunity to muck with ``sys.meta_path`` before any
``import`` is performed. It could also be achieved by introducing an
initialization config option to somehow inject code at the right point
during startup to register the ``sys.meta_path`` importer. This
could be done by importing a named module (presumably serviced by the
frozen or built-in importer) and having that module run code to modify
``sys.meta_path`` as a side-effect of module evaluation at import time.
A variation would be to define a callable in said module to call after the
module is importer. Whatever the solution, there needs to be a way to
somehow inject a ``sys.meta_path`` importer before any ``import`` not
serviced by the frozen or built-in importers is performed.

Lacking Support for Statically Linked Builds
--------------------------------------------

Python really wants you to be using shared libraries for ``libpython``
and extension modules seem to strongly insist on this.

On Windows, there is no official Visual Studio project configuration
for static builds. Actually achieving one requires a lot of hacks to
the build system (see ``python-build-standalone`` project).

There is ~0 support for building statically linked extension modules
in packaging tools, from the build step itself all the way up to
distribution. (PyOxidizer's approach is to hack ``distutils`` to
record and save the object files that were compiled and then ``PyOxidizer``
manually links these object files into the final binary.)

To achieve a statically linked executable containing ``libpython`` and
extension modules, you effectively need to build everything from source.
And if you want to distribute that executable, you often need to build
with special toolchains to ensure binary portability.

There is tons of room for Python to better support static linking.
A possible good place to start would be for packaging tools to support
building extension modules which don't rely on a dynamic ``libpython``.
If artifacts containing the raw object files designed for static
linking were made available on PyPI, PyOxidizer could download
pre-built binaries and link them directly into an executable or custom
``libpython``. This would avoid having to recompile said extension
modules at repackaging time. The compatibility guarantees would likely
look a lot like existing binary wheels.

On a related front, it would be nice if musl libc based binary wheels were
standardized. There are some concerns about the performance and compatibility
of musl libc when it comes to Python. But musl libc is a valid deploy
target nonetheless and it would be nice if Python officially supported
it. (FWIW the performance concerns seem to stem from memory allocator
performance and PyOxidizer supports using jemalloc as the allocator,
bypassing this problem.)

Windows Embeddable Distributions Missing Functionality
------------------------------------------------------

The Windows embeddable zip file distributions of CPython are missing
certain functionality.

The distributions do not contain source code for Python modules in the
standard library. This means PyOxidizer can't easily bundle sources from
these distributions.

The ``ensurepip`` module is not present in the distribution. So there is
no way to install ``pip`` using the distribution itself.

The ``venv`` module is also not present in the distribution. So there's
no way to create virtualenvs using the distribution itself.

The Python C development headers are not part of the distribution, so
even if you install packaging tools, you can't build C extensions.

Extension Module / Shared Library Filename Ambiguity
----------------------------------------------------

On some platforms, Python extension modules and shared libraries have
the same filename extension. e.g. on Linux, both are named ``foo.so``.

PyOxidizer's packaging functionality needs to classify files as
specific resource types (source modules, bytecode modules, resource
files, extension modules, shared libraries, etc). Because certain file
patterns (like ``.so``) are ambiguous, PyOxidizer cannot perform this
classification trivially.

It would be much preferred if there were unique file extensions that
distinguished Python extension modules from regular shared libraries.

On Windows, this is already the case with the ``.pyd`` extension.
However, POSIX architectures aren't so fortunate.

Ambiguous File Classification
-----------------------------

This is somewhat related to the previous section but is more generic.

Python's default path-based importer dynamically looks for presence
of various files on the filesystem and loads the first type variant
(extension module, bytecode, source, etc) discovered.

PyOxidizer's importer indexes resources during packaging and its
import-time resource resolution is static: the type of resource is
baked into the definition of the resource.

These approaches are somewhat at odds with each other. The path-based
importer is dynamic in nature: it defers answering questions until
a specific resource is requested. PyOxidizer's importer is static /
pre-compiled: it must classify a resource based on its filename/path
so it can bake that knowledge into an immutable data structure. It
does not have knowledge of what names will be requested at run-time.

Bridging this divide has revealed various ambiguities and corner cases
in the filenames of Python resources.

The Python extension module or shared library ambiguity is described
above.

There is also an ambiguity with extra files that aren't part of
a known Python package. If you attempt to classify every file in
a ``sys.path`` directory, it is tempting to classify a file as a
Python module (``.py``, ``.pyc``, or extension module), package
resource (``importlib.resources``), or package metadata (e.g.
``.dist-info`` files accessed via ``importlib.metadata``). However,
there exists the possibility that a file is not obviously classified
as one of these.

For example, a file ``foo/libfoo.so`` without the presence of a
``foo/__init__.py`` file is ambiguous. We could say this is an
extension module (``foo.libfoo``) due to the extension module
shared library ambiguity. We could also consider this a package
resource ``foo:libfoo.so`` or ``"":foo/libfoo.so``. Although the
latter case of using an empty string for the package name doesn't
make much sense. And we arguably shouldn't consider it a resource
of ``foo`` because no obvious ``foo`` Python package exists!

This is relevant in the real world because various Python packages
rely on installing arbitrary files in ``sys.path`` directories.
For example, ``numpy`` installs files like
``numpy.libs/libz-eb09ad1d.so.1.2.3``, where the ``numpy.libs``
directory only contains file extensions ``*.so[.*]``. Note that
this example is particularly confusing because the directory names
in ``sys.path`` directories are typically split on ``.`` and
correspond to Python [sub-]packages.

Because there is no unambiguous way to classify all files in
a ``sys.path`` directory and because Python packaging tools allow
the presence of files not contained within a known Python package
(identified by the presence of an ``__init__`` file/module), this
externalizes the requirement to introduce an *other* classification
of files. And because a specific file can't easily be classified
as a specific type, this effectively prevents the use of *resource*
loading techniques not involving explicit filesystem I/O without
significant smarts. I.e. because PyOxidizer cannot easily
unambiguously identify file X as a specific type, it is forced to
materialize that file at a similar location on the run-time system.
However, if runtimes like PyOxidizer were able to identify the
type of a file by its file extension and/or presence of other files,
it would know exactly how to load/treat the file at run-time without
having to resort to heuristics.

This ambiguity effectively means that PyOxidizer needs to:

* Determine if a file is a shared library or not (because shared
  libraries are treated specially and we can't unambiguously identify
  a shared library from its file extension).
* Examine symbols within shared libraries to see if a Python extension
  module is present (via presence of ``PyInit_*`` symbols).
* Preserve *extra* files not present in a Python package. (In the case
  of numpy, there are no *obvious* links to the shared libraries in the
  ``numpy.libs`` directory: this relative path is encoded within the
  extension module shared library via e.g. ``DT_NEEDED``.)

The most robust mitigation to this ambiguity is for all files
associated with an installable Python package/distribution to be
annotated with their type and for Python package installers to refuse
to process files that aren't identified. This could be achieved by
having a ``.dist-info/`` file annotating the *role* of each file.

Push Harder for Wheels
----------------------

Wheels are superior for Python packaging distribution because they
are more *static* and follow a finite set of rules for how they
should be installed. In theory, one could write code to install a
wheel in any programming language. Non-wheel distributions, however,
are a different matter entirely. A ``.tar.gz`` source distribution
often relies on running a ``setup.py`` file, which requires a Python
interpreter.

In the ideal world, PyOxidizer doesn't care about how a package is
built: just the files that comprise the installed package. So wheels
are a more desirable distribution format. In fact, PyOxidizer has
Rust code for extracting wheels and repackaging their contents: no
Python necessary. This means PyOxidizer can do things like download
wheels targeting non-native architectures and it *just works*.

As good as wheels are, they are universal in Python land. There are
tons of packages that don't have wheel distributions and continue to
offer the older ``.tar.gz`` distribution format.

We would like to see a concerted effort to push harder for the
presence of wheels. For example, PyPI could encourage/nag package
maintainers to upload wheels.

No Way to Hook ``open()``
-------------------------

``oxidized_importer`` wants to load Python modules and resource data
from memory, without using files.

There is a convention of using virtual paths to express paths within
some other entity. e.g. the zip importer uses ``/path/to/archive.zip/foo.py``
refers to the path ``foo.py`` within the ``/path/to/archive.zip`` zip file.
It is also common to use the current executable's path to refer to
entities within the current executable. e.g. ``/path/to/myapp/foo.py``
would refer to a ``foo.py`` somehow embedded in the ``/path/to/myapp``
executable.

These virtual paths are a great idea. You can even implement ``pathlib.Path``
around these paths and have a custom ``Path.open()`` that does custom I/O.
However, it is really easy for these paths to *leak* and to get fed in to
``io.open()`` or similar APIs for operating on filesystem paths. For example,
someone does ``open(foo.__path__, "rb")`` instead of ``foo.__path__.open("rb")``.
If this happens, you'll likely get an I/O error since virtual paths aren't
real filesystem paths.

It would be really nice if Python had some abstraction around filesystem
I/O that allowed custom paths to be registered. This is what schemes in URIs
and URLs are for. e.g. ``file:///path/to/file``. However, schemes aren't
paths per se. So if we want to preserve compatibility with a path based
API and allow ``io.open()`` to work with virtual paths, we need a mechanism
to register a hook to intercept ``io.open()`` (and possibly other I/O
operations like ``stat()``) so we can plumb in a custom I/O implementation.

PEP 578 almost does this with ``PyFile_SetOpenCodeHook()`` and the
``io.open_code()`` mechanism. But ``io.open_code()`` is only for a limited
use case and isn't generally usable.

``sys.executable`` is a String Instead of List
----------------------------------------------

Python applications often want to invoke a new Python interpreter process.
Generally, you use ``sys.executable`` to find the filesystem path to
``python`` then run that executable.

This is all fine for traditional Python interpreter install layouts that have
a ``python`` executable. However, in embedded contexts, there may not be
a ``python`` executable. Rather, the application embedding Python may provide
a more advanced way to invoke a Python interpreter. e.g. ``myapp python
<interpreter arguments>``.

Since ``sys.executable`` is a string and is often fed directly into ``exec()``,
it isn't possible to express a multi-argument *run a Python interpreter* value
through ``sys.executable``.

To do this robustly while maintaining backwards compatibility, we need a new
attribute somewhere that defines a list of arguments for invoking a Python
interpreter. In traditional Python install environments, this would be
``[sys.executable]``.

This idea was proposed at
https://mail.python.org/archives/list/python-ideas@python.org/thread/O66N56PB4U6AGICGBSRFD2OWA5JWMFC6/#O66N56PB4U6AGICGBSRFD2OWA5JWMFC6.
