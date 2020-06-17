public extension Environment {
    struct Key: RawRepresentable, Hashable {
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

public extension Environment.Key {
    static let builtProductsDir = Environment.Key(rawValue: "BUILT_PRODUCTS_DIR")
    static let configurationName = Environment.Key(rawValue: "CONFIGURATION")
    static let dyldFrameworkPath = Environment.Key(rawValue: "DYLD_FRAMEWORK_PATH")
    static let frameworksFolderPath = Environment.Key(rawValue: "FRAMEWORKS_FOLDER_PATH")
    static let infoPlistFile = Environment.Key(rawValue: "INFOPLIST_FILE")
    static let platformName = Environment.Key(rawValue: "PLATFORM_NAME")
    static let sourceRoot = Environment.Key(rawValue: "SOURCE_ROOT")
    static let targetName = Environment.Key(rawValue: "TARGETNAME")
    static let xcTestConfigurationFilePath = Environment.Key(rawValue: "XCTestConfigurationFilePath")
}
