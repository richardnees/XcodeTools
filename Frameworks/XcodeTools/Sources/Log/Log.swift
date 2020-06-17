public class Log {
    
    /// Log level severity
    public enum Level: String {
        case note
        case warning
        case error
    }
    
    /// Formatted output based on parameters
    /// - Parameters:
    ///   - message: Custom log message
    ///   - level: Log level
    ///   - file: Source file name
    ///   - line: Source file line number
    ///   - indentation: Log indentation
    /// - Returns: Formatted String
    static func formattedString(
        _ message: String,
        level: Level = .note,
        file: String = #file,
        line: Int = #line,
        indentation: Int = 0) -> String {
        
        let tab = "\t"
        var tabs: [String] = []
        for _ in 0..<indentation { tabs.append(tab) }
        let indentationString = tabs.joined(separator: "")

        return "\(file):\(line): \(level.rawValue): \(indentationString + message)"
    }
    
    /// Print out note to Xcode build log
    /// - Parameters:
    ///   - message: Custom log message
    ///   - level: Log level
    ///   - file: Source file name
    ///   - line: Source file line number
    ///   - indentation: Log indentation
    @discardableResult
    public static func note(
        _ message: String,
        file: String = #file,
        line: Int = #line,
        indentation: Int = 0) -> String {
        let output = formattedString(message, level: .note, file: file, line: line, indentation: indentation)
        print(output)
        return output
    }

    /// Print out warning to Xcode build log
    /// - Parameters:
    ///   - message: Custom log message
    ///   - file: Source file name
    ///   - line: Source file line number
    ///   - indentation: Log indentation
    @discardableResult
    public static func warning(
        _ message: String,
        file: String = #file,
        line: Int = #line,
        indentation: Int = 0) -> String {
        let output = formattedString(message, level: .warning, file: file, line: line, indentation: indentation)
        print(output)
        return output
    }

    /// Print out error to Xcode build log
    /// - Parameters:
    ///   - message: Custom log message
    ///   - file: Source file name
    ///   - line: Source file line number
    ///   - indentation: Log indentation
    @discardableResult
    public static func error(
        _ message: String,
        file: String = #file,
        line: Int = #line,
        indentation: Int = 0) -> String {
        let output = formattedString(message, level: .error, file: file, line: line, indentation: indentation)
        print(output)
        // Exit if we aren't running unit tests
        if !runningTests {
            exit(1)
        }
        return output
    }

    private static var runningTests: Bool {
        return Environment.environmentVariables
        .filter({ $0.0 == Environment.Key.xcTestConfigurationFilePath.rawValue })
        .map({ $0.1 })
        .first != nil
    }
}
