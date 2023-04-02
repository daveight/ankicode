.. py:currentmodule:: starlark_pyoxidizer

.. _rust_cargo_source_checkouts:

============================================
Using Cargo with PyOxidizer Source Checkouts
============================================

PyOxidizer's source repository consists of multiple Rust projects/crates.
At the root of the repository is a ``Cargo.toml`` defining a workspace
consisting of all these crates.

.. important::

   Building various Rust crates from source can be extremely brittle and
   a top-level ``cargo build`` will likely encounter multiple build
   failures.

If you want to run ``cargo`` from a PyOxidizer source checkout, you will
likely want to limit the invocation to a single crate at a time to ensure
things can build.

The following sections detail how to build various crates inside a
source checkout.

``pyoxidizer`` Crate
====================

Building the ``pyoxidizer`` crate in isolation (e.g.
``cargo build -p pyoxidizer``) should *just work*, as it is a pretty typical
Rust crate.

Perhaps the only special property of this crate is that it defines both
a library and an executable. So you may want to limit operations to a specific
binary. e.g. ``cargo build --bin pyoxidizer`` or
``cargo test --bin pyoxidizer``.

``python-packed-resources`` Crate
=================================

This is a standard Rust crate and should always build without issue. e.g.
``cargo build -p python-packed-resources``.

``python-packaging`` Crate
==========================

This is a standard Rust crate and should always build without issue. e.g.
``cargo build -p python-packaging`` or ``cargo test -p python-packaging``.

``pyembed`` Crate
=================

The ``pyembed`` crate provides the bulk of the run-time functionality for
binaries embedding Python interpreters. Because the crate needs to consult
with a Python interpreter at build time and link against it, its build
configuration can be fragile.

.. important::

   Almost all workspace build failures are somehow related to the ``pyembed``
   crate.

In its default configuration, a Python 3.9 executable needs to be found on
``PATH``. If said executable can't be found, you'll get a
``No python interpreter found of version 3.*`` error at build time.

To work around this, add a ``python3.9`` or ``python3`` executable to
``PATH`` or run ``cargo build`` with the ``PYO3_PYTHON`` environment
variable pointing to a specific Python 3 executable. e.g.

    $ PYO3_PYTHON=/path/to/python3.9 cargo build -p pyembed

``python-oxidized-importer`` Crate
==================================

This crate defines a Python extension module defining a Python meta path
importer. See :ref:`oxidized_importer`.

This crate needs to link against a Python interpreter and the same
caveats for the ``pyembed`` crate apply to it as well.
