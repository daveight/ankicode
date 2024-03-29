.. py:currentmodule:: starlark_pyoxidizer

===========================
``PythonInterpreterConfig``
===========================

.. py:class:: PythonInterpreterConfig

    This type configures the default behavior of the embedded Python interpreter.

    Embedded Python interpreters are configured and instantiated using a
    Rust ``pyembed::OxidizedPythonInterpreterConfig`` data structure. The
    ``pyembed`` crate defines a default instance of this data structure with
    parameters defined by the settings in this type.

    .. note::

       If you are writing custom Rust code and constructing a custom
       ``pyembed::OxidizedPythonInterpreterConfig`` instance and don't use the
       default instance, this config type is not relevant to you and can be
       omitted from your config file.

    .. danger::

       Some of the settings exposed by Python's initialization APIs are
       extremely low level and brittle. Various combinations can cause
       the process to crash/exit ungracefully. Be very cautious when setting
       these low-level settings.

    Instances are constructed by calling
    :py:meth:`PythonDistribution.make_python_interpreter_config`.

    Instance state is managed via attributes.

    There are a ton of attributes and most attributes are not relevant
    to most applications. The bulk of the attributes exist to give full
    control over Python interpreter initialization.

    The following attributes control features provided by the ``pyembed`` Rust crate,
    which manages the embedded Python interpreter in generated executables.
    These attributes provide features and level of control over
    embedded Python interpreters beyond what is possible with Python's
    `initialization C API <https://docs.python.org/3/c-api/init_config.html>`_.

    * :py:attr:`allocator_backend`
    * :py:attr:`allocator_raw`
    * :py:attr:`allocator_mem`
    * :py:attr:`allocator_obj`
    * :py:attr:`allocator_pymalloc_arena`
    * :py:attr:`allocator_debug`
    * :py:attr:`oxidized_importer`
    * :py:attr:`filesystem_importer`
    * :py:attr:`argvb`
    * :py:attr:`multiprocessing_auto_dispatch`
    * :py:attr:`multiprocessing_start_method`
    * :py:attr:`sys_frozen`
    * :py:attr:`sys_meipass`
    * :py:attr:`terminfo_resolution`
    * :py:attr:`write_modules_directory_env`

    The following attributes correspond to fields of the
    `PyPreConfig <https://docs.python.org/3/c-api/init_config.html#c.PyPreConfig>`_
    C struct used to initialize the Python interpreter.

    * :py:attr:`config_profile`
    * :py:attr:`allocator`
    * :py:attr:`configure_locale`
    * :py:attr:`coerce_c_locale`
    * :py:attr:`coerce_c_locale_warn`
    * :py:attr:`development_mode`
    * :py:attr:`isolated`
    * :py:attr:`legacy_windows_fs_encoding`
    * :py:attr:`parse_argv`
    * :py:attr:`use_environment`
    * :py:attr:`utf8_mode`

    The following attributes correspond to fields of the
    `PyConfig <https://docs.python.org/3/c-api/init_config.html#c.PyConfig>`_
    C struct used to initialize the Python interpreter.

    * :py:attr:`base_exec_prefix`
    * :py:attr:`base_executable`
    * :py:attr:`base_prefix`
    * :py:attr:`buffered_stdio`
    * :py:attr:`bytes_warning`
    * :py:attr:`check_hash_pycs_mode`
    * :py:attr:`configure_c_stdio`
    * :py:attr:`dump_refs`
    * :py:attr:`exec_prefix`
    * :py:attr:`executable`
    * :py:attr:`fault_handler`
    * :py:attr:`filesystem_encoding`
    * :py:attr:`hash_seed`
    * :py:attr:`home`
    * :py:attr:`import_time`
    * :py:attr:`inspect`
    * :py:attr:`install_signal_handlers`
    * :py:attr:`interactive`
    * :py:attr:`legacy_windows_stdio`
    * :py:attr:`malloc_stats`
    * :py:attr:`module_search_paths`
    * :py:attr:`optimization_level`
    * :py:attr:`parser_debug`
    * :py:attr:`pathconfig_warnings`
    * :py:attr:`prefix`
    * :py:attr:`program_name`
    * :py:attr:`pycache_prefix`
    * :py:attr:`python_path_env`
    * :py:attr:`quiet`
    * :py:attr:`run_command`
    * :py:attr:`run_filename`
    * :py:attr:`run_module`
    * :py:attr:`show_ref_count`
    * :py:attr:`site_import`
    * :py:attr:`skip_first_source_line`
    * :py:attr:`stdio_encoding`
    * :py:attr:`stdio_errors`
    * :py:attr:`tracemalloc`
    * :py:attr:`user_site_directory`
    * :py:attr:`verbose`
    * :py:attr:`warn_options`
    * :py:attr:`write_bytecode`
    * :py:attr:`x_options`

    .. py:attribute:: allocator_backend

        (``string``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_allocator_backend`.

        The ``jemalloc``, ``mimalloc``, and ``snmalloc`` allocators require the
        presence of additional Rust crates. A run-time error will occur if these
        allocators are configured but the binary was built without these crates.
        (This should not occur when using ``pyoxidizer`` to build the binary.)

        When a custom allocator is configured, the autogenerated Rust crate
        used to build the binary will configure the Rust global allocator
        (``#[global_allocator] attribute``) to use the specified allocator.

        .. important::

           The ``rust`` allocator is not recommended because it introduces performance
           overhead. But it may help with debugging in some situations.

        .. note::

           Both ``mimalloc`` and ``snmalloc`` require the ``cmake`` build tool
           to compile code as part of their build process. If this tool is not
           available in the build environment, you will encounter a build error
           with a message similar to ``failed to execute command: The system
           cannot find the file specified. (os error 2) is `cmake` not installed?``.

           The workaround is to install cmake or use a different allocator.

        .. note::

           ``snmalloc`` only supports targeting to macOS 10.14 or newer. You will
           likely see build errors when building a binary targeting macOS 10.13 or
           older.

        Default is ``jemalloc`` on non-Windows targets and ``default`` on Windows.
        (The ``jemalloc-sys`` crate doesn't work on Windows MSVC targets.)

    .. py:attribute:: allocator_raw

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_allocator_raw`.

        Defaults to ``True``.

    .. py:attribute:: allocator_mem

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_allocator_mem`.

        Defaults to ``False``.

    .. py:attribute:: allocator_obj

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_allocator_obj`.

        Defaults to ``False``.

    .. py:attribute:: allocator_pymalloc_arena

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_allocator_pymalloc_arena`.

        Defaults to ``False``.

    .. py:attribute:: allocator_debug

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_allocator_debug`.

        Defaults to ``False``.

    .. py:attribute:: oxidized_importer

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_oxidized_importer`.

        Defaults to ``True``.

    .. py:attribute:: filesystem_importer

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_filesystem_importer`.

        The filesystem importer is enabled automatically if
        :py:attr:`PythonInterpreterConfig.module_search_paths` is non-empty.

    .. py:attribute:: argvb

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_argvb`.

    .. py:attribute:: multiprocessing_auto_dispatch

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_multiprocessing_auto_dispatch`.

        Default value is ``True``.

        See :ref:`pyoxidizer_packaging_multiprocessing_dispatch` for more.

    .. py:attribute:: multiprocessing_start_method

        (``str``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_multiprocessing_start_method`.

    .. py:attribute:: sys_frozen

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_sys_frozen`.

        Default is ``True``.

    .. py:attribute:: sys_meipass

        (``bool``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_sys_meipass`.

        Default is ``False``.

    .. py:attribute:: terminfo_resolution

        (``string``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_terminfo_resolution`.

        See :ref:`terminfo_database` for more about terminal databases.

    .. py:attribute:: write_modules_directory_env

        (``string`` or ``None``)

        See :ref:`pyembed_struct_OxidizedPythonInterpreterConfig_write_modules_directory_env`.

    .. py:attribute:: config_profile

        (``string``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_profile`.

    .. py:attribute:: allocator

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_allocator`.

    .. py:attribute:: configure_locale

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_configure_locale`.

    .. py:attribute:: coerce_c_locale

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_coerce_c_locale`.

    .. py:attribute:: coerce_c_locale_warn

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_coerce_c_locale_warn`.

    .. py:attribute:: development_mode

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_development_mode`.

    .. py:attribute:: isolated

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_isolated`.

    .. py:attribute:: legacy_windows_fs_encoding

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_legacy_windows_fs_encoding`.

    .. py:attribute:: parse_argv

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_parse_argv`.

    .. py:attribute:: use_environment

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_use_environment`.

    .. py:attribute:: utf8_mode

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_utf8_mode`.

    .. py:attribute:: base_exec_prefix

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_base_exec_prefix`.

    .. py:attribute:: base_executable

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_base_executable`.

    .. py:attribute:: base_prefix

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_base_prefix`.

    .. py:attribute:: buffered_stdio

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_buffered_stdio`.

    .. py:attribute:: bytes_warning

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_bytes_warning`.

    .. py:attribute:: check_hash_pycs_mode

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_check_hash_pycs_mode`.

    .. py:attribute:: configure_c_stdio

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_configure_c_stdio`.

    .. py:attribute:: dump_refs

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_dump_refs`.

    .. py:attribute:: exec_prefix

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_exec_prefix`.

    .. py:attribute:: executable

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_executable`.

    .. py:attribute:: fault_handler

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_fault_handler`.

    .. py:attribute:: filesystem_encoding

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_filesystem_encoding`.

    .. py:attribute:: filesystem_errors

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_filesystem_errors`.

    .. py:attribute:: hash_seed

        (``int`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_hash_seed`.

        ``PyConfig.use_hash_seed`` will automatically be set if this attribute is
        defined.

    .. py:attribute:: home

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_home`.

    .. py:attribute:: import_time

        See :ref:`pyembed_struct_PythonInterpreterConfig_import_time`.

    .. py:attribute:: inspect

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_inspect`.

    .. py:attribute:: install_signal_handlers

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_install_signal_handlers`.

    .. py:attribute:: interactive

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_interactive`.

    .. py:attribute:: legacy_windows_stdio

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_legacy_windows_stdio`.

    .. py:attribute:: malloc_stats

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_malloc_stats`.

    .. py:attribute:: module_search_paths

        (``list[string]`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_module_search_paths`.

        Setting this to a non-empty value also has the side-effect of setting
        ``filesystem_importer = True``

    .. py:attribute:: optimization_level

        (``int`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_optimization_level`.

    .. py:attribute:: parser_debug

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_parser_debug`.

    .. py:attribute:: pathconfig_warnings

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_pathconfig_warnings`.

    .. py:attribute:: prefix

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_prefix`.

    .. py:attribute:: program_name

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_program_name`.

    .. py:attribute:: pycache_prefix

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_pycache_prefix`.

    .. py:attribute:: python_path_env

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_python_path_env`.

    .. py:attribute:: quiet

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_quiet`.

    .. py:attribute:: run_command

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_run_command`.

    .. py:attribute:: run_filename

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_run_filename`.

    .. py:attribute:: run_module

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_run_module`.

    .. py:attribute:: show_ref_count

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_show_ref_count`.

    .. py:attribute:: site_import

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_site_import`.

        The ``site`` module is typically not needed for standalone/isolated Python
        applications.

    .. py:attribute:: skip_first_source_line

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_skip_first_source_line`.

    .. py:attribute:: stdio_encoding

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_stdio_encoding`.

    .. py:attribute:: stdio_errors

        (``string`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_stdio_errors`.

    .. py:attribute:: tracemalloc

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_tracemalloc`.

    .. py:attribute:: user_site_directory

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_user_site_directory`.

    .. py:attribute:: verbose

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_verbose`.

    .. py:attribute:: warn_options

        (``list[string]`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_warn_options`.

    .. py:attribute:: write_bytecode

        (``bool`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_write_bytecode`.

    .. py:attribute:: x_options

        (``list[string]`` or ``None``)

        See :ref:`pyembed_struct_PythonInterpreterConfig_x_options`.

Starlark Caveats
================

The :py:class:`PythonInterpreterConfig` Starlark type is backed by a Rust data
structure. And when attributes are retrieved, a copy of the underlying
Rust struct field is returned.

This means that if you attempt to mutate a Starlark value (as opposed to
assigning an attribute), the mutation won't be reflected on the underlying
Rust data structure.

For example:

.. code-block:: python

   config = dist.make_python_interpreter_config()

   # assigns vec!["foo", "bar"].
   config.module_search_paths = ["foo", "bar"]

   # Creates a copy of the underlying list and appends to that copy.
   # The stored value of `module_search_paths` is still `["foo", "bar"]`.
   config.module_search_paths.append("baz")

To append to a list, do something like the following:

.. code-block:: python

   value = config.module_search_paths
   value.append("baz")
   config.module_search_paths = value
