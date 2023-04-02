.. py:currentmodule:: starlark_pyoxidizer

=========================
``PythonPackagingPolicy``
=========================

.. py:class:: PythonPackagingPolicy

    When building a Python binary, there are various settings that control which
    Python resources are added, where they are imported from, and other various
    settings. This collection of settings is referred to as a *Python Packaging
    Policy*. These settings are represented by the ``PythonPackagingPolicy`` type.

    .. py:attribute:: allow_files

        (``bool``)

        Whether to allow the collection of generic *file* resources.

        If false, all collected/packaged resources must be instances of
        concrete resource types (``PythonModuleSource``, ``PythonPackageResource``,
        etc).

        If true, :py:class:`File` instances can be added to resource
        collectors.

    .. py:attribute:: allow_in_memory_shared_library_loading

        (``bool``)

        Whether to allow loading of Python extension modules and shared libraries
        from memory at run-time.

        Some platforms (notably Windows) allow opening shared libraries from a
        memory address. This mode of opening shared libraries allows libraries
        to be embedded in binaries without having to statically link them. However,
        not every library works correctly when loaded this way.

        This flag defines whether to enable this feature where supported. Its
        true value can be ignored if the target platform doesn't support loading
        shared library from memory.

    .. py:attribute:: bytecode_optimize_level_zero

        (``bool``)

        Whether to add Python bytecode at optimization level 0 (the
        default optimization level the Python interpreter compiles bytecode for).

    .. py:attribute:: bytecode_optimize_level_one

        (``bool``)

        Whether to add Python bytecode at optimization level 1.

    .. py:attribute:: bytecode_optimize_level_two

        (``bool``)

        Whether to add Python bytecode at optimization level 2.

    .. py:attribute:: extension_module_filter

        (``string``)

        The filter to apply to determine which extension modules to add.
        The following values are recognized:

        ``all``
          Every named extension module will be included.

        ``minimal``
          Return only extension modules that are required to initialize a
          Python interpreter. This is a very small set and various functionality
          from the Python standard library will not work with this value.

        ``no-libraries``
          Return only extension modules that don't require any additional libraries.

          Most common Python extension modules are included. Extension modules
          like ``_ssl`` (links against OpenSSL) and ``zlib`` are not included.

        ``no-copyleft``
          Return only extension modules that do not link against *copyleft* licensed
          libraries.

          Not all Python distributions may annotate license info for all extensions
          or the libraries they link against. If license info is missing, the
          extension is not included because it *could* be *copyleft* licensed.
          Similarly, the mechanism for determining whether a license is *copyleft* is
          based on the SPDX license annotations, which could be wrong or out of date.

        Default is ``all``.

    .. py:attribute:: file_scanner_classify_files

        (``bool``)

        Whether file scanning should attempt to classify files and emit typed
        resources corresponding to the detected file type.

        If ``True``, operations that emit resource objects (such as
        :py:meth:`PythonExecutable.pip_install`) will emit specific
        types for each resource flavor. e.g. :py:class:`PythonModuleSource`,
        :py:class:`PythonExtensionModule`, etc.

        If ``False``, the file scanner does not attempt to classify the type of
        a file and this rich resource types are not emitted.

        Can be used in conjunction with
        :py:attr:`PythonPackagingPolicy.file_scanner_emit_files`. If both
        are ``True``, there will be a :py:class:`File` and an optional non-file
        resource for each source file.

        Default is ``True``.

    .. py:attribute:: file_scanner_emit_files

        (``bool``)

        Whether file scanning should emit file resources for each seen file.

        If ``True``, operations that emit resource objects (such as
        :py:meth:`PythonExecutable.pip_install`) will emit
        :py:class:`File` instances for each encountered file.

        If ``False``, :py:class:`File` instances will not be emitted.

        Can be used in conjunction with
        :py:attr:`PythonPackagingPolicy.file_scanner_classify_files`.

        Default is ``False``.

    .. py:attribute:: include_classified_resources

        (``bool``)

        Whether strongly typed, classified non-:py:class:`File` resources have their
        ``add_include`` attribute set to ``True`` by default.

        Default is ``True``.

    .. py:attribute:: include_distribution_sources

        (``bool``)

        Whether to add source code for Python modules in the Python
        distribution.

        Default is ``True``.

    .. py:attribute:: include_distribution_resources

        (``bool``)

        Whether to add Python package resources for Python packages
        in the Python distribution.

        Default is ``False``.

    .. py:attribute:: include_file_resources

        (``bool``)

        Whether :py:class:`File` resources have their ``add_include`` attribute
        set to ``True`` by default.

        Default is ``False``.

    .. py:attribute:: include_non_distribution_sources

        (``bool``)

        Whether to add source code for Python modules not in the Python
        distribution.

    .. py:attribute:: include_test

        (``bool``)

        Whether to add Python resources related to tests.

        Not all files associated with tests may be properly flagged as such.
        This is a best effort setting.

        Default is ``False``.

    .. py:attribute:: resources_location

        (``string``)

        The location that resources should be added to by default.

        Default is ``in-memory``.

    .. py:attribute:: resources_location_fallback

        (``string`` or ``None``)

        The fallback location that resources should be added to if
        ``resources_location`` fails.

        Default is ``None``.

    .. py:attribute:: preferred_extension_module_variants

        (``dict<string, string>``) (readonly)

        Mapping of extension module name to variant name.

        This mapping defines which preferred named variant of an extension module
        to use. Some Python distributions offer multiple variants of the same
        extension module. This mapping allows defining which variant of which
        extension to use when choosing among them.

        Keys set on this dict are not reflected in the underlying policy. To set
        a key, call the ``set_preferred_extension_module_variant()`` method.


    .. py:method:: register_resource_callback(f: Callable)

        This method registers a Starlark function to be called when resource objects
        are created. The passed function receives 2 arguments: this
        ``PythonPackagingPolicy`` instance and the resource (e.g.
        ``PythonModuleSource``) that was created.

        The purpose of the callback is to enable Starlark configuration files to
        mutate resources upon creation so they can globally influence how those
        resources are packaged.

    .. py:method:: set_preferred_extension_module_variant(extension: str, variant: str)

        This method will set a preferred Python extension module variant to
        use. See the documentation for ``preferred_extension_module_variants``
        above for more.

        It accepts 2 ``string`` arguments defining the extension module name
        and its preferred variant.

    .. py:method:: set_resource_handling_mode(mode: str)

        This method takes a string argument denoting the *resource handling mode*
        to apply to the policy. This string can have the following values:

        ``classify``
           Files are classified as typed resources and handled as such.

           Only classified resources can be added by default.

        ``files``
           Files are handled as raw files (as opposed to typed resources).

           Only files can be added by default.

        This method is effectively a convenience method for bulk-setting
        multiple attributes on the instance given a behavior mode.

        ``classify`` will configure the file scanner to emit classified resources,
        configure the ``add_include`` attribute to only be ``True`` on classified
        resources, and will disable the addition of :py:class:`File` resources on resource
        collectors.

        ``files`` will configure the file scanner to only emit :py:class:`File` resources,
        configure the ``add_include`` attribute to ``True`` on :py:class:`File` and *classified*
        resources, and will allow resource collectors to add :py:class:`File` instances.
