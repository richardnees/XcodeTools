public class Environment {
    
    public static var environmentVariables: [String : String] {
        return ProcessInfo.processInfo.environment
    }
    
    public static func environmentVariable(for rawKey: String) -> String? {
        guard let environmentVariable = Environment.environmentVariables
            .filter({ $0.0 == rawKey })
            .map({ $0.1 })
            .first
            else {
                Log.error("Environment doesn't provide \(rawKey)", line: #line)
            return nil
        }
        return environmentVariable
    }
    
    public static func environmentVariable(for key: Environment.Key) -> String? {
        return Environment.environmentVariable(for: key.rawValue)
    }
}

// MARK: - Build Settings Convenience

extension Environment {

    public static var builtProductsFolderURL: URL? {
        guard let builtProductsFolderPath = Environment.environmentVariable(for: .builtProductsDir) else { return nil }
        return URL(fileURLWithPath: builtProductsFolderPath)
    }
    
    public static var configurationName: String? {
        return Environment.environmentVariable(for: .configurationName)
    }
    
    public static var frameworksFolderPathComponent: String? {
        return Environment.environmentVariable(for: .frameworksFolderPath)
    }
    
    public static var frameworksFolderURL: URL? {
        guard let frameworksFolderPathComponent = frameworksFolderPathComponent else { return nil }
        return Environment.builtProductsFolderURL?.appendingPathComponent(frameworksFolderPathComponent)
    }

    public static var infoPlistURL: URL? {
        guard
            let sourceRoot = Environment.environmentVariable(for: .sourceRoot),
            let infoPlistFile = Environment.environmentVariable(for: .infoPlistFile)
            else { return nil }
            
        let sourceRootURL = URL(fileURLWithPath: sourceRoot)
        let infoPlistURL = sourceRootURL.appendingPathComponent(infoPlistFile)
                
        return infoPlistURL
    }

    public static var platformName: PlatformName {
        guard
            let rawPlatformName = Environment.environmentVariable(for: .platformName),
            let platformName = PlatformName(rawValue: rawPlatformName)
            else { return .unsupported }
        return platformName
    }
    
    public static var sourceRootURL: URL? {
        guard let sourceRootPath = Environment.environmentVariable(for: .sourceRoot) else { return nil }
        return URL(fileURLWithPath: sourceRootPath)
    }

    public static var targetName: String? {
        return Environment.environmentVariable(for: .targetName)
    }
}
