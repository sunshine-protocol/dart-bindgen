use fmt::Display;
use std::fmt;

/// Represents the different methods to create a `DynamicLibrary`.
#[derive(Debug, Clone)]
pub enum DynamicLibraryCreationMode {
    /// Creates a dynamic library representing the running executable.
    Executable,
    /// Loads a dynamic library file with local visibility.
    Open(String),
    /// Creates a dynamic library holding all global symbols.
    Process,
}

impl DynamicLibraryCreationMode {
    /// a suger method for [`DynamicLibraryCreationMode::Open`]
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
    /// Create [`DynamicLibraryPlatformConfig`] using the provided
    /// [`DynamicLibraryCreationMode`]
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

/// Defines, how the dynamic library should be loaded on each of dart's known
/// platforms.
#[derive(Debug, Clone, Default)]
pub struct DynamicLibraryConfig {
    /// how to load the dynamic library when the operating system is a version
    /// of `Android`.
    pub android: Option<DynamicLibraryPlatformConfig>,
    /// how to load the dynamic library when the operating system is a version
    /// `Fuchsia`.
    pub fuchsia: Option<DynamicLibraryPlatformConfig>,
    /// how to load the dynamic library when the operating system is a version
    /// `iOS`.
    pub ios: Option<DynamicLibraryPlatformConfig>,
    /// how to load the dynamic library when the operating system is a version
    /// `Linux`.
    pub linux: Option<DynamicLibraryPlatformConfig>,
    /// how to load the dynamic library when the operating system is a version
    /// `macOS`.
    pub macos: Option<DynamicLibraryPlatformConfig>,
    /// how to load the dynamic library when the operating system is a version
    /// `Windows`.
    pub windows: Option<DynamicLibraryPlatformConfig>,
}
