// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

pub mod testutil;

use {
    anyhow::{anyhow, Result},
    linked_hash_map::LinkedHashMap,
    log::warn,
    path_dedot::ParseDot,
    starlark::{
        environment::{Environment, EnvironmentError, TypeValues},
        eval::call_stack::CallStack,
        values::{
            error::{RuntimeError, ValueError, INCORRECT_PARAMETER_TYPE_ERROR_CODE},
            none::NoneType,
            {Mutable, TypedValue, Value, ValueResult},
        },
        {
            starlark_fun, starlark_module, starlark_parse_param_type, starlark_signature,
            starlark_signature_extraction, starlark_signatures,
        },
    },
    std::{
        borrow::Cow,
        collections::{BTreeMap, HashMap},
        os::raw::c_ulong,
        path::{Path, PathBuf},
    },
};

/// How a resolved target can be run.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum RunMode {
    /// Target cannot be run.
    None,
    /// Target is run by executing a path.
    Path { path: PathBuf },
}

/// Represents a resolved target.
#[derive(Debug, Clone)]
pub struct ResolvedTarget {
    /// How the built target can be run.
    pub run_mode: RunMode,

    /// Where build artifacts are stored on the filesystem.
    pub output_path: PathBuf,
}

impl ResolvedTarget {
    pub fn run(&self) -> Result<()> {
        match &self.run_mode {
            RunMode::None => Ok(()),
            RunMode::Path { path } => {
                let status = std::process::Command::new(path)
                    .current_dir(path.parent().unwrap())
                    .status()?;

                if status.success() {
                    Ok(())
                } else {
                    Err(anyhow!("cargo run failed"))
                }
            }
        }
    }
}

pub struct ResolvedTargetValue {
    pub inner: ResolvedTarget,
}

impl TypedValue for ResolvedTargetValue {
    type Holder = Mutable<ResolvedTargetValue>;
    const TYPE: &'static str = "ResolvedTarget";

    fn values_for_descendant_check_and_freeze(&self) -> Box<dyn Iterator<Item = Value>> {
        Box::new(std::iter::empty())
    }
}

impl From<ResolvedTarget> for ResolvedTargetValue {
    fn from(t: ResolvedTarget) -> Self {
        Self { inner: t }
    }
}

/// Represents a registered target in the Starlark environment.
#[derive(Debug, Clone)]
pub struct Target {
    /// The Starlark callable registered to this target.
    pub callable: Value,

    /// Other targets this one depends on.
    pub depends: Vec<String>,

    /// What calling callable returned, if it has been called.
    pub resolved_value: Option<Value>,

    /// The `ResolvedTarget` instance this target's build() returned.
    ///
    /// TODO consider making this an Arc<T> so we don't have to clone it.
    pub built_target: Option<ResolvedTarget>,
}

/// Holds execution context for a Starlark environment.
#[derive(Debug)]
pub struct EnvironmentContext {
    /// Current working directory.
    cwd: PathBuf,

    /// Default output directory.
    build_path: PathBuf,

    /// Optional path prefix to insert between the build path and the target name.
    target_build_path_prefix: Option<PathBuf>,

    /// Registered targets.
    ///
    /// A target is a name and a Starlark callable.
    targets: BTreeMap<String, Target>,

    /// Order targets are registered in.
    targets_order: Vec<String>,

    /// Name of the default target.
    default_target: Option<String>,

    /// List of targets to resolve.
    resolve_targets: Option<Vec<String>>,

    // TODO figure out a generic way to express build script mode.
    /// Name of default target to resolve in build script mode.
    pub default_build_script_target: Option<String>,

    /// Whether we are operating in Rust build script mode.
    ///
    /// This will change the default target to resolve.
    pub build_script_mode: bool,
}

impl EnvironmentContext {
    pub fn new(cwd: PathBuf) -> Self {
        let build_path = cwd.join("build");

        Self {
            cwd,
            build_path,
            target_build_path_prefix: None,
            targets: BTreeMap::new(),
            targets_order: vec![],
            default_target: None,
            resolve_targets: None,
            default_build_script_target: None,
            build_script_mode: false,
        }
    }

    /// Obtain the current working directory for this context.
    pub fn cwd(&self) -> &Path {
        &self.cwd
    }

    /// Directory to use for the build path.
    pub fn build_path(&self) -> &Path {
        &self.build_path
    }

    /// Update the directory to use for the build path.
    pub fn set_build_path(&mut self, path: &Path) -> Result<()> {
        let path = if path.is_relative() {
            self.cwd.join(path)
        } else {
            path.to_path_buf()
        }
        .parse_dot()?
        .to_path_buf();

        self.build_path = path;

        Ok(())
    }

    /// Resolve an absolute filesystem path from a path input.
    ///
    /// If the incoming path is absolute, it is returned. Otherwise relative
    /// paths are joined with the current build path.
    pub fn resolve_path(&self, path: impl AsRef<Path>) -> PathBuf {
        let path = path.as_ref();

        if path.is_absolute() || path.to_string_lossy().starts_with('/') {
            path.to_path_buf()
        } else {
            self.build_path.join(path)
        }
    }

    /// Set the path prefix to use for per-target build paths.
    ///
    /// If defined, target build paths are of the form `<build_path>/<prefix>/<target>`.
    /// Otherwise they are `<build_path>/<target>`.
    pub fn set_target_build_path_prefix<P: AsRef<Path>>(&mut self, prefix: Option<P>) {
        self.target_build_path_prefix = prefix.map(|p| p.as_ref().to_path_buf());
    }

    /// Obtain the directory to use to build a named target.
    pub fn target_build_path(&self, target: &str) -> PathBuf {
        if let Some(prefix) = &self.target_build_path_prefix {
            self.build_path.join(prefix).join(target)
        } else {
            self.build_path.join(target)
        }
    }

    /// Obtain all registered targets.
    pub fn targets(&self) -> &BTreeMap<String, Target> {
        &self.targets
    }

    /// Obtain the default target to resolve.
    pub fn default_target(&self) -> Option<&str> {
        self.default_target.as_deref()
    }

    /// Obtain a named target.
    pub fn get_target(&self, target: &str) -> Option<&Target> {
        self.targets.get(target)
    }

    /// Obtain a mutable named target.
    pub fn get_target_mut(&mut self, target: &str) -> Option<&mut Target> {
        self.targets.get_mut(target)
    }

    /// Set the list of targets to resolve.
    pub fn set_resolve_targets(&mut self, targets: Vec<String>) {
        self.resolve_targets = Some(targets);
    }

    /// Obtain the order that targets were registered in.
    pub fn targets_order(&self) -> &Vec<String> {
        &self.targets_order
    }

    /// Register a named target.
    pub fn register_target(
        &mut self,
        target: String,
        callable: Value,
        depends: Vec<String>,
        default: bool,
        default_build_script: bool,
    ) {
        if !self.targets.contains_key(&target) {
            self.targets_order.push(target.clone());
        }

        self.targets.insert(
            target.clone(),
            Target {
                callable,
                depends,
                resolved_value: None,
                built_target: None,
            },
        );

        if default || self.default_target.is_none() {
            self.default_target = Some(target.clone());
        }

        if default_build_script || self.default_build_script_target.is_none() {
            self.default_build_script_target = Some(target);
        }
    }

    /// Determine what targets should be resolved.
    ///
    /// This isn't the full list of targets that will be resolved, only the main
    /// targets that we will instruct the resolver to resolve.
    pub fn targets_to_resolve(&self) -> Vec<String> {
        if let Some(targets) = &self.resolve_targets {
            targets.clone()
        } else if self.build_script_mode && self.default_build_script_target.is_some() {
            vec![self.default_build_script_target.clone().unwrap()]
        } else if let Some(target) = &self.default_target {
            vec![target.to_string()]
        } else {
            Vec::new()
        }
    }
}

impl TypedValue for EnvironmentContext {
    type Holder = Mutable<EnvironmentContext>;
    const TYPE: &'static str = "EnvironmentContext";

    fn values_for_descendant_check_and_freeze(&self) -> Box<dyn Iterator<Item = Value>> {
        Box::new(std::iter::empty())
    }
}

#[derive(Default)]
struct PlaceholderContext {}

impl TypedValue for PlaceholderContext {
    type Holder = Mutable<PlaceholderContext>;
    const TYPE: &'static str = "BuildTargets";

    fn values_for_descendant_check_and_freeze(&self) -> Box<dyn Iterator<Item = Value>> {
        Box::new(std::iter::empty())
    }
}

pub fn required_type_arg(arg_name: &str, arg_type: &str, value: &Value) -> Result<(), ValueError> {
    let t = value.get_type();
    if t == arg_type {
        Ok(())
    } else {
        Err(ValueError::from(RuntimeError {
            code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
            message: format!(
                "function expects a {} for {}; got type {}",
                arg_type, arg_name, t
            ),
            label: format!("expect type {}; got {}", arg_type, t),
        }))
    }
}

pub fn optional_type_arg(arg_name: &str, arg_type: &str, value: &Value) -> Result<(), ValueError> {
    match value.get_type() {
        "NoneType" => Ok(()),
        _ => required_type_arg(arg_name, arg_type, value),
    }
}

pub fn optional_str_arg(name: &str, value: &Value) -> Result<Option<String>, ValueError> {
    match value.get_type() {
        "NoneType" => Ok(None),
        "string" => Ok(Some(value.to_str())),
        t => Err(ValueError::from(RuntimeError {
            code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
            message: format!(
                "function expects an optional string for {}; got type {}",
                name, t
            ),
            label: format!("expected type string; got {}", t),
        })),
    }
}

pub fn optional_bool_arg(name: &str, value: &Value) -> Result<Option<bool>, ValueError> {
    match value.get_type() {
        "NoneType" => Ok(None),
        "bool" => Ok(Some(value.to_bool())),
        t => Err(ValueError::from(RuntimeError {
            code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
            message: format!(
                "function expects an optional bool for {}; got type {}",
                name, t
            ),
            label: format!("expected type bool; got {}", t),
        })),
    }
}

pub fn optional_int_arg(name: &str, value: &Value) -> Result<Option<i64>, ValueError> {
    match value.get_type() {
        "NoneType" => Ok(None),
        "int" => Ok(Some(value.to_int()?)),
        t => Err(ValueError::from(RuntimeError {
            code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
            message: format!(
                "function expected an optional int for {}; got type {}",
                name, t
            ),
            label: format!("expected type int; got {}", t),
        })),
    }
}

pub fn required_list_arg(
    arg_name: &str,
    value_type: &str,
    value: &Value,
) -> Result<(), ValueError> {
    match value.get_type() {
        "list" => {
            for v in &value.iter()? {
                if v.get_type() == value_type {
                    Ok(())
                } else {
                    Err(ValueError::from(RuntimeError {
                        code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                        message: format!(
                            "list {} expects values of type {}; got {}",
                            arg_name,
                            value_type,
                            v.get_type()
                        ),
                        label: format!("expected type {}; got {}", value_type, v.get_type()),
                    }))
                }?;
            }
            Ok(())
        }
        t => Err(ValueError::from(RuntimeError {
            code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
            message: format!("function expects a list for {}; got type {}", arg_name, t),
            label: format!("expected type list; got {}", t),
        })),
    }
}

pub fn optional_list_arg(
    arg_name: &str,
    value_type: &str,
    value: &Value,
) -> Result<(), ValueError> {
    if value.get_type() == "NoneType" {
        return Ok(());
    }

    required_list_arg(arg_name, value_type, value)
}

pub fn required_dict_arg(
    arg_name: &str,
    key_type: &str,
    value_type: &str,
    value: &Value,
) -> Result<(), ValueError> {
    match value.get_type() {
        "dict" => {
            for k in &value.iter()? {
                if k.get_type() == key_type {
                    Ok(())
                } else {
                    Err(ValueError::from(RuntimeError {
                        code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                        message: format!(
                            "dict {} expects keys of type {}; got {}",
                            arg_name,
                            key_type,
                            k.get_type()
                        ),
                        label: format!("expected type {}; got {}", key_type, k.get_type()),
                    }))
                }?;

                let v = value.at(k.clone())?;

                if v.get_type() == value_type {
                    Ok(())
                } else {
                    Err(ValueError::from(RuntimeError {
                        code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                        message: format!(
                            "dict {} expects values of type {}; got {}",
                            arg_name,
                            value_type,
                            v.get_type(),
                        ),
                        label: format!("expected type {}; got {}", value_type, v.get_type()),
                    }))
                }?;
            }
            Ok(())
        }
        t => Err(ValueError::from(RuntimeError {
            code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
            message: format!("function expects a dict for {}; got type {}", arg_name, t),
            label: format!("expected type dict; got {}", t),
        })),
    }
}

pub fn optional_dict_arg(
    arg_name: &str,
    key_type: &str,
    value_type: &str,
    value: &Value,
) -> Result<(), ValueError> {
    if value.get_type() == "NoneType" {
        return Ok(());
    }

    required_dict_arg(arg_name, key_type, value_type, value)
}

pub trait ToOptional<T> {
    fn to_optional(&self) -> Option<T>;
}

impl ToOptional<bool> for Value {
    fn to_optional(&self) -> Option<bool> {
        if self.get_type() == "NoneType" {
            None
        } else {
            Some(self.to_bool())
        }
    }
}

impl ToOptional<String> for Value {
    fn to_optional(&self) -> Option<String> {
        if self.get_type() == "NoneType" {
            None
        } else {
            Some(self.to_string())
        }
    }
}

impl ToOptional<Cow<'static, str>> for Value {
    fn to_optional(&self) -> Option<Cow<'static, str>> {
        if self.get_type() == "NoneType" {
            None
        } else {
            Some(Cow::Owned(self.to_string()))
        }
    }
}

impl ToOptional<PathBuf> for Value {
    fn to_optional(&self) -> Option<PathBuf> {
        if self.get_type() == "NoneType" {
            None
        } else {
            Some(PathBuf::from(self.to_string()))
        }
    }
}

pub trait TryToOptional<T> {
    fn try_to_optional(&self) -> Result<Option<T>, ValueError>;
}

impl TryToOptional<c_ulong> for Value {
    fn try_to_optional(&self) -> Result<Option<c_ulong>, ValueError> {
        if self.get_type() == "NoneType" {
            Ok(None)
        } else {
            Ok(Some(self.to_int()? as c_ulong))
        }
    }
}

impl TryToOptional<i64> for Value {
    fn try_to_optional(&self) -> Result<Option<i64>, ValueError> {
        match self.get_type() {
            "NoneType" => Ok(None),
            "int" => Ok(Some(self.to_int()?)),
            t => Err(ValueError::from(RuntimeError {
                code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                message: format!("expected int or NoneType; got {}", t),
                label: "".to_string(),
            })),
        }
    }
}

impl TryToOptional<Vec<String>> for Value {
    fn try_to_optional(&self) -> Result<Option<Vec<String>>, ValueError> {
        if self.get_type() == "NoneType" {
            Ok(None)
        } else {
            let values = self.to_vec()?;

            Ok(Some(
                values.iter().map(|x| x.to_string()).collect::<Vec<_>>(),
            ))
        }
    }
}

impl TryToOptional<Vec<Cow<'static, str>>> for Value {
    fn try_to_optional(&self) -> Result<Option<Vec<Cow<'static, str>>>, ValueError> {
        if self.get_type() == "NoneType" {
            Ok(None)
        } else {
            let values = self.to_vec()?;

            Ok(Some(
                values
                    .iter()
                    .map(|x| Cow::Owned(x.to_string()))
                    .collect::<Vec<_>>(),
            ))
        }
    }
}

impl TryToOptional<Vec<PathBuf>> for Value {
    fn try_to_optional(&self) -> Result<Option<Vec<PathBuf>>, ValueError> {
        if self.get_type() == "NoneType" {
            Ok(None)
        } else {
            let values = self.to_vec()?;

            Ok(Some(
                values
                    .iter()
                    .map(|x| PathBuf::from(x.to_string()))
                    .collect::<Vec<_>>(),
            ))
        }
    }
}

type StringHashMap = HashMap<Cow<'static, str>, Cow<'static, str>>;

impl TryToOptional<StringHashMap> for Value {
    fn try_to_optional(&self) -> Result<Option<StringHashMap>, ValueError> {
        match self.get_type() {
            "NoneType" => Ok(None),
            "dict" => {
                let mut res = HashMap::new();

                for key in &self.iter()? {
                    let value = self.at(key.clone())?;

                    res.insert(Cow::Owned(key.to_string()), Cow::Owned(value.to_string()));
                }

                Ok(Some(res))
            }
            t => Err(ValueError::from(RuntimeError {
                code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                message: format!("expected dict or NoneType; got {}", t),
                label: "".to_string(),
            })),
        }
    }
}

impl TryToOptional<HashMap<Cow<'static, str>, StringHashMap>> for Value {
    fn try_to_optional(
        &self,
    ) -> Result<Option<HashMap<Cow<'static, str>, StringHashMap>>, ValueError> {
        match self.get_type() {
            "NoneType" => Ok(None),
            "dict" => {
                let mut res = HashMap::new();

                for key in &self.iter()? {
                    let value = self.at(key.clone())?;

                    let value: Option<HashMap<Cow<'static, str>, Cow<'static, str>>> =
                        value.try_to_optional()?;

                    match value {
                        Some(v) => {
                            res.insert(Cow::Owned(key.to_string()), v);
                        }
                        None => {
                            return Err(ValueError::from(RuntimeError {
                                code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                                message: "expected dict[string, string], got None".to_string(),
                                label: "".to_string(),
                            }));
                        }
                    }
                }

                Ok(Some(res))
            }
            t => Err(ValueError::from(RuntimeError {
                code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                message: format!("expected dict or NoneType; got {}", t),
                label: "".to_string(),
            })),
        }
    }
}

impl TryToOptional<Vec<StringHashMap>> for Value {
    fn try_to_optional(&self) -> Result<Option<Vec<StringHashMap>>, ValueError> {
        match self.get_type() {
            "NoneType" => Ok(None),
            "list" => {
                let mut res = Vec::new();

                for item in &self.iter()? {
                    match item.get_type() {
                        "dict" => {
                            let value: Option<StringHashMap> = item.try_to_optional()?;

                            match value {
                                Some(value) => {
                                    res.push(value);
                                }
                                None => {
                                    return Err(ValueError::from(RuntimeError {
                                        code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                                        message: "expected dict[string, string], got None"
                                            .to_string(),
                                        label: "".to_string(),
                                    }));
                                }
                            }
                        }
                        t => {
                            return Err(ValueError::from(RuntimeError {
                                code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                                message: format!("expected dict[string, string], got {}", t),
                                label: "".to_string(),
                            }));
                        }
                    }
                }

                Ok(Some(res))
            }
            t => Err(ValueError::from(RuntimeError {
                code: INCORRECT_PARAMETER_TYPE_ERROR_CODE,
                message: format!("expected list or NoneType; got {}", t),
                label: "".to_string(),
            })),
        }
    }
}

const ENVIRONMENT_CONTEXT_SYMBOL: &str = "BUILD_CONTEXT";

/// Obtain the `Value` holding the `EnvironmentContext` for a Starlark environment.
///
/// This is a helper function. The returned `Value` needs to be casted
/// to have much value.
pub fn get_context_value(type_values: &TypeValues) -> ValueResult {
    type_values
        .get_type_value(
            &Value::new(PlaceholderContext::default()),
            ENVIRONMENT_CONTEXT_SYMBOL,
        )
        .ok_or_else(|| {
            ValueError::from(RuntimeError {
                code: "STARLARK_BUILD_CONTEXT",
                message: "Unable to resolve context (this should never happen)".to_string(),
                label: "".to_string(),
            })
        })
}

/// print(*args)
fn starlark_print(args: &[Value]) -> ValueResult {
    let mut parts = Vec::new();
    let mut first = true;
    for arg in args {
        if !first {
            parts.push(" ".to_string());
        }
        first = false;
        parts.push(arg.to_string());
    }

    warn!("{}", parts.join(""));

    Ok(Value::new(NoneType::None))
}

/// register_target(target, callable, depends=None, default=false)
fn starlark_register_target(
    type_values: &TypeValues,
    target: String,
    callable: Value,
    depends: Value,
    default: bool,
    default_build_script: bool,
) -> ValueResult {
    required_type_arg("callable", "function", &callable)?;
    optional_list_arg("depends", "string", &depends)?;

    let depends = match depends.get_type() {
        "list" => depends.iter()?.iter().map(|x| x.to_string()).collect(),
        _ => Vec::new(),
    };

    let raw_context = get_context_value(type_values)?;
    let mut context = raw_context
        .downcast_mut::<EnvironmentContext>()?
        .ok_or(ValueError::IncorrectParameterType)?;

    context.register_target(target, callable, depends, default, default_build_script);

    Ok(Value::new(NoneType::None))
}

/// resolve_target(target)
///
/// This will return a Value returned from the called function.
///
/// If the target is already resolved, its cached return value is returned
/// immediately.
///
/// If the target depends on other targets, those targets will be resolved
/// recursively before calling the target's function.
fn starlark_resolve_target(
    type_values: &TypeValues,
    call_stack: &mut CallStack,
    target: String,
) -> ValueResult {
    // The block is here so the borrowed `EnvironmentContext` goes out of
    // scope before we call into another Starlark function. Without this, we
    // could get a double borrow.
    let target_entry = {
        let raw_context = get_context_value(type_values)?;
        let context = raw_context
            .downcast_ref::<EnvironmentContext>()
            .ok_or(ValueError::IncorrectParameterType)?;

        // If we have a resolved value for this target, return it.
        if let Some(v) = if let Some(t) = context.get_target(&target) {
            t.resolved_value.as_ref().cloned()
        } else {
            None
        } {
            return Ok(v);
        }

        warn!("resolving target {}", target);

        match context.get_target(&target) {
            Some(v) => Ok((*v).clone()),
            None => Err(ValueError::from(RuntimeError {
                code: "BUILD_TARGETS",
                message: format!("target {} does not exist", target),
                label: "resolve_target()".to_string(),
            })),
        }?
    };

    // Resolve target dependencies.
    let mut args = Vec::new();

    for depend_target in target_entry.depends {
        args.push(starlark_resolve_target(
            type_values,
            call_stack,
            depend_target,
        )?);
    }

    let res = target_entry.callable.call(
        call_stack,
        type_values,
        args,
        LinkedHashMap::new(),
        None,
        None,
    )?;

    // TODO consider replacing the target's callable with a new function that returns the
    // resolved value. This will ensure a target function is only ever called once.

    // We can't obtain a mutable reference to the context above because it
    // would create multiple borrows.
    let raw_context = get_context_value(type_values)?;
    let mut context = raw_context
        .downcast_mut::<EnvironmentContext>()?
        .ok_or(ValueError::IncorrectParameterType)?;

    if let Some(target_entry) = context.get_target_mut(&target) {
        target_entry.resolved_value = Some(res.clone());
    }

    Ok(res)
}

/// resolve_targets()
fn starlark_resolve_targets(type_values: &TypeValues, call_stack: &mut CallStack) -> ValueResult {
    let resolve_target_fn = type_values
        .get_type_value(&Value::new(PlaceholderContext::default()), "resolve_target")
        .ok_or_else(|| {
            ValueError::from(RuntimeError {
                code: "BUILD_TARGETS",
                message: "could not find resolve_target() function (this should never happen)"
                    .to_string(),
                label: "resolve_targets()".to_string(),
            })
        })?;

    // Limit lifetime of EnvironmentContext borrow to prevent double borrows
    // due to Starlark calls below.
    let targets = {
        let raw_context = get_context_value(type_values)?;
        let context = raw_context
            .downcast_ref::<EnvironmentContext>()
            .ok_or(ValueError::IncorrectParameterType)?;

        let targets = context.targets_to_resolve();
        warn!("resolving {} targets", targets.len());

        targets
    };

    for target in targets {
        resolve_target_fn.call(
            call_stack,
            type_values,
            vec![Value::new(target)],
            LinkedHashMap::new(),
            None,
            None,
        )?;
    }

    Ok(Value::new(NoneType::None))
}

/// set_build_path(path)
fn starlark_set_build_path(type_values: &TypeValues, path: String) -> ValueResult {
    let context_value = get_context_value(type_values)?;
    let mut context = context_value
        .downcast_mut::<EnvironmentContext>()?
        .ok_or(ValueError::IncorrectParameterType)?;

    context.set_build_path(&PathBuf::from(&path)).map_err(|e| {
        ValueError::from(RuntimeError {
            code: "BUILD_TARGETS",
            message: e.to_string(),
            label: "set_build_path()".to_string(),
        })
    })?;

    Ok(Value::new(NoneType::None))
}

starlark_module! { build_targets_module =>
    print(*args) {
        starlark_print(&args)
    }

    register_target(
        env env,
        target: String,
        callable,
        depends = NoneType::None,
        default: bool = false,
        default_build_script: bool = false
    ) {
        starlark_register_target(env, target, callable, depends, default, default_build_script)
    }

    resolve_target(env env, call_stack cs, target: String) {
        starlark_resolve_target(env, cs, target)
    }

    resolve_targets(env env, call_stack cs) {
        starlark_resolve_targets(env, cs)
    }

    set_build_path(env env, path: String) {
        starlark_set_build_path(env, path)
    }
}

/// Register our Starlark dialect with an environment and type values.
pub fn register_starlark_dialect(
    env: &mut Environment,
    type_values: &mut TypeValues,
) -> Result<(), EnvironmentError> {
    build_targets_module(env, type_values);

    Ok(())
}

/// Populate a Starlark environment with state.
///
/// This sets variables (as opposed to type values) and is suitable to call on a child
/// environment when the parent environment is already frozen.
pub fn populate_environment(
    env: &mut Environment,
    type_values: &mut TypeValues,
    context: EnvironmentContext,
) -> Result<(), EnvironmentError> {
    env.set(ENVIRONMENT_CONTEXT_SYMBOL, Value::new(context))?;

    // We alias various globals as BuildTargets.* attributes so they are
    // available via the type object API. This is a bit hacky. But it allows
    // Rust code with only access to the TypeValues dictionary to retrieve
    // these symbols.
    for f in &[
        "register_target",
        "resolve_target",
        "resolve_targets",
        "set_build_path",
        ENVIRONMENT_CONTEXT_SYMBOL,
    ] {
        type_values.add_type_value(PlaceholderContext::TYPE, f, env.get(f)?);
    }

    Ok(())
}

/// Build a registered target in a Starlark environment.
pub fn build_target(
    _env: &mut Environment,
    type_values: &TypeValues,
    call_stack: &mut CallStack,
    target: &str,
) -> Result<ResolvedTarget> {
    let resolved_value = {
        let context_value = get_context_value(type_values)
            .map_err(|_| anyhow!("unable to resolve context value"))?;
        let context = context_value
            .downcast_ref::<EnvironmentContext>()
            .ok_or_else(|| anyhow!("context has incorrect type"))?;

        let v = if let Some(t) = context.get_target(target) {
            if let Some(t) = &t.built_target {
                return Ok(t.clone());
            }

            if let Some(v) = &t.resolved_value {
                v.clone()
            } else {
                return Err(anyhow!("target {} is not resolved", target));
            }
        } else {
            return Err(anyhow!("target {} is not resolved", target));
        };

        v
    };

    let build = type_values
        .get_type_value(&resolved_value, "build")
        .ok_or_else(|| anyhow!("{} does not implement build()", resolved_value.get_type()))?;

    let resolved_target_value = build
        .call(
            call_stack,
            type_values,
            vec![resolved_value, Value::from(target)],
            LinkedHashMap::new(),
            None,
            None,
        )
        .map_err(|e| anyhow!("error calling build(): {:?}", e))?;

    let resolved_target = resolved_target_value
        .downcast_ref::<ResolvedTargetValue>()
        .unwrap();

    let context_value = get_context_value(type_values)
        .map_err(|e| anyhow!("unable to resolve context: {:?}", e))?;
    let mut context = context_value
        .downcast_mut::<EnvironmentContext>()
        .map_err(|_| anyhow!("unable to obtain mutable context"))?
        .ok_or_else(|| anyhow!("context has incorrect type"))?;

    context.get_target_mut(target).unwrap().built_target = Some(resolved_target.inner.clone());

    Ok(resolved_target.inner.clone())
}

/// Runs a named target.
///
/// Runs the default target is a target name is not specified.
pub fn run_target(
    env: &mut Environment,
    type_values: &TypeValues,
    call_stack: &mut CallStack,
    target: Option<&str>,
) -> Result<()> {
    let target = {
        // Block to avoid nested borrow.
        let context_value = get_context_value(type_values)
            .map_err(|e| anyhow!("unable to resolve context value: {:?}", e))?;
        let context = context_value.downcast_ref::<EnvironmentContext>().unwrap();

        if let Some(t) = target {
            t.to_string()
        } else if let Some(t) = context.default_target() {
            t.to_string()
        } else {
            return Err(anyhow!("unable to determine target to run"));
        }
    };

    let resolved_target = build_target(env, type_values, call_stack, &target)?;

    resolved_target.run()
}

#[cfg(test)]
mod test {
    use super::*;
    use crate::testutil::*;

    #[test]
    fn test_register_target() -> Result<()> {
        let mut env = StarlarkEnvironment::new()?;
        env.eval("def foo(): pass")?;
        env.eval("register_target('default', foo)")?;

        let context_value = get_context_value(&env.type_values).unwrap();
        let context = context_value
            .downcast_ref::<EnvironmentContext>()
            .ok_or(ValueError::IncorrectParameterType)
            .unwrap();

        assert_eq!(context.targets().len(), 1);
        assert!(context.get_target("default").is_some());
        assert_eq!(
            context.get_target("default").unwrap().callable.to_string(),
            "foo()".to_string()
        );
        assert_eq!(context.targets_order(), &vec!["default".to_string()]);
        assert_eq!(context.default_target(), Some("default"));

        Ok(())
    }

    #[test]
    fn test_register_target_multiple() -> Result<()> {
        let mut env = StarlarkEnvironment::new()?;
        env.eval("def foo(): pass")?;
        env.eval("def bar(): pass")?;
        env.eval("register_target('foo', foo)")?;
        env.eval("register_target('bar', bar, depends=['foo'], default=True)")?;

        let context_value = get_context_value(&env.type_values).unwrap();
        let context = context_value
            .downcast_ref::<EnvironmentContext>()
            .ok_or(ValueError::IncorrectParameterType)
            .unwrap();

        assert_eq!(context.targets().len(), 2);
        assert_eq!(context.default_target(), Some("bar"));
        assert_eq!(
            &context.get_target("bar").unwrap().depends,
            &vec!["foo".to_string()],
        );

        Ok(())
    }
}
