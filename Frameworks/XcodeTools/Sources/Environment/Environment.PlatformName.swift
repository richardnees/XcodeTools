extension Environment {
    
    /// Target Platform
    public enum PlatformName: String, CaseIterable {
        case unsupported
        case macosx
        case iphoneos
        case iphonesimulator
        case appletvos
        case appletvsimulator
        case watchos
        case watchsimulator
    }
    
}
