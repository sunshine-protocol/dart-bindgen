use fmt::Display;
use std::fmt;

/// Represents the different methods to create a `DynamicLibrary`.
#[derive(Debug, Clone)]
pub enum DynamicLibraryCreationMode {
    Executable,
    Open(String),
    Process,
}

impl DynamicLibraryCreationMode {
    pub fn open(path: impl Into<String>) -> Self { Self::Open(path.into()) }
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

impl From<DynamicLibraryCreationMode> for Option<DynamicLibraryPlatformConfig> {
    fn from(mode: DynamicLibraryCreationMode) -> Self {
        Some(DynamicLibraryPlatformConfig::new(mode))
    }
}

impl Display for DynamicLibraryPlatformConfig {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self.creation_mode {
            DynamicLibraryCreationMode::Executable => {
                write!(f, "DynamicLibrary.executable()")
            },
            DynamicLibraryCreationMode::Open(ref path) => {
                write!(f, "DynamicLibrary.open('{}')", path)
            },
            DynamicLibraryCreationMode::Process => {
                write!(f, "DynamicLibrary.process()")
            },
        }
    }
}

/// Defines, how the dynamic library should be loaded on each of darts known
/// platforms.
#[derive(Debug, Clone, Default)]
pub struct DynamicLibraryConfig {
    pub windows: Option<DynamicLibraryPlatformConfig>,
    pub linux: Option<DynamicLibraryPlatformConfig>,
    pub macos: Option<DynamicLibraryPlatformConfig>,
    pub ios: Option<DynamicLibraryPlatformConfig>,
    pub android: Option<DynamicLibraryPlatformConfig>,
    pub fuchsia: Option<DynamicLibraryPlatformConfig>,
}
