import XCTest
@testable import XcodeTools

class EnvironmentTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_environmentVariables() {
        XCTAssertNotNil(Environment.environmentVariables)
    }

    func test_environmentVariablesNotEmpty() {
        XCTAssertFalse(Environment.environmentVariables.isEmpty)
    }

    func test_configurationName() {
        setenv("CONFIGURATION", "Release", 1)
        
        XCTAssertEqual(Environment.configurationName, "Release")
    }

    func test_configurationName_isNil() {
        unsetenv("CONFIGURATION")
        XCTAssertNil(Environment.configurationName)
    }

    func test_targetName() {
        setenv("TARGETNAME", "MyGreatApp", 1)
        
        XCTAssertEqual(Environment.targetName, "MyGreatApp")
    }

    func test_targetName_isNil() {
        unsetenv("TARGETNAME")
        XCTAssertNil(Environment.targetName)
    }

    func test_infoPlistURL() {
        setenv("SOURCE_ROOT", "/Users/dev/Project", 1)
        setenv("INFOPLIST_FILE", "Sources/Info.plist", 1)
        
        XCTAssertEqual(Environment.infoPlistURL, URL(fileURLWithPath: "/Users/dev/Project/Sources/Info.plist"))
    }

    func test_infoPlistURL_isNil() {
        unsetenv("INFOPLIST_FILE")

        XCTAssertNil(Environment.infoPlistURL)
    }

    func test_sourceRootURL() {
        setenv("SOURCE_ROOT", "/Users/dev/Project", 1)

        XCTAssertEqual(Environment.sourceRootURL, URL(fileURLWithPath: "/Users/dev/Project"))
        
    }

    func test_sourceRootURL_isNil() {
        unsetenv("SOURCE_ROOT")
        
        XCTAssertNil(Environment.sourceRootURL)
    }

    func test_platformName_iphoneos() {
        setenv("PLATFORM_NAME", "iphoneos", 1)
        
        XCTAssertEqual(Environment.platformName, Environment.PlatformName(rawValue: "iphoneos"))
    }

    func test_platformName_iphonesimulator() {
        setenv("PLATFORM_NAME", "iphonesimulator", 1)
        
        XCTAssertEqual(Environment.platformName, Environment.PlatformName(rawValue: "iphonesimulator"))
    }

    func test_platformName_isUnsupported_when_unset() {
        unsetenv("PLATFORM_NAME")

        XCTAssertEqual(Environment.platformName, .unsupported)
    }
    
    func test_platformName_isUnsupported_with_garbage_string() {
        setenv("PLATFORM_NAME", "asdasdasd", 1)
        
        XCTAssertNotNil(Environment.platformName)
    }
    
    func test_builtProductsFolderURL() {
        setenv("BUILT_PRODUCTS_DIR", "/Users/dev/Project", 1)
        
        XCTAssertEqual(Environment.builtProductsFolderURL, URL(fileURLWithPath: "/Users/dev/Project"))
    }
    
    func test_builtProductsFolderURL_isNil() {
        unsetenv("BUILT_PRODUCTS_DIR")
        
        XCTAssertNil(Environment.builtProductsFolderURL)
    }

    func test_frameworksFolderURL() {
        setenv("BUILT_PRODUCTS_DIR", "/Users/dev/Project", 1)
        setenv("FRAMEWORKS_FOLDER_PATH", "Frameworks", 1)
        
        XCTAssertEqual(Environment.frameworksFolderURL, Environment.builtProductsFolderURL?.appendingPathComponent("Frameworks"))
    }
    
    func test_frameworksFolderURL_isNil() {
        unsetenv("FRAMEWORKS_FOLDER_PATH")
        
        XCTAssertNil(Environment.frameworksFolderURL)
    }
}
