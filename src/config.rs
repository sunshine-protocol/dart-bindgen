/// Represents the different methods to create a `DynamicLibrary`.
#[derive(Debug, Clone)]
pub enum DynamicLibraryCreationMode {
    Executable,
    Open(String),
    Process,
}

/// Configures how a `DynamicLibrary` should be created on a platform.
///
/// The different constructors represents the different constructors modes of
/// `DynamicLibrary`. See [`DynamicLibraryCreationMode`] for more information.
#[derive(Debug, Clone)]
pub struct DynamicLibraryPlatformConfig {
    creation_mode: DynamicLibraryCreationMode,
}

impl DynamicLibraryPlatformConfig {
    pub const fn new(mode: DynamicLibraryCreationMode) -> Self {
        Self {
            creation_mode: mode,
        }
    }
}

impl ToString for DynamicLibraryPlatformConfig {
    fn to_string(&self) -> String {
        match self.creation_mode {
            DynamicLibraryCreationMode::Executable => {
                String::from("DynamicLibrary.executable()")
            },
            DynamicLibraryCreationMode::Open(ref path) => {
                format!("DynamicLibrary.open({})", path)
            },
            DynamicLibraryCreationMode::Process => {
                String::from("DynamicLibrary.process()")
            },
        }
    }
}

/// Defines, how the dynamic library should be loaded on each of darts known
/// platforms.
///
/// If the `DynamicLibraryPlatformConfig` is `None` for a platform, this
/// platform will fallback to `default`, except for `iOS` it is default to use
/// [`DynamicLibraryCreationMode::Executable`]
#[derive(Debug, Clone)]
pub struct DynamicLibraryConfig {
    pub windows: Option<DynamicLibraryPlatformConfig>,
    pub linux: Option<DynamicLibraryPlatformConfig>,
    pub macos: Option<DynamicLibraryPlatformConfig>,
    pub ios: Option<DynamicLibraryPlatformConfig>,
    pub android: Option<DynamicLibraryPlatformConfig>,
    pub fuchsia: Option<DynamicLibraryPlatformConfig>,
    default: DynamicLibraryPlatformConfig,
}

impl DynamicLibraryConfig {
    pub fn new(default: DynamicLibraryPlatformConfig) -> Self {
        Self {
            windows: Some(default.clone()),
            linux: Some(default.clone()),
            macos: Some(default.clone()),
            ios: Some(DynamicLibraryPlatformConfig::new(
                DynamicLibraryCreationMode::Executable,
            )),
            android: Some(default.clone()),
            fuchsia: Some(default.clone()),
            default,
        }
    }
}
