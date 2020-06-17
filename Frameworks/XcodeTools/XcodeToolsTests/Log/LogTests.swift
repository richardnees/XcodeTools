import XCTest
@testable import XcodeTools

class LogTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_outputNoteNoIdentation() {
        let message = "Note - No Indentation"
        let format = Log.note(message)

        XCTAssertTrue(format.contains(" note: Note - No Indentation"))
    }
    
    func test_outputNoteDoubleIdentation() {
        let message = "Note - Double Indentation"
        let format = Log.note(message, indentation: 2)

        XCTAssertTrue(format.contains(" note: \t\tNote - Double Indentation"))
    }

    func test_outputWarning() {
        let message = "Something is not quite right"
        let format = Log.warning(message)
        
        XCTAssertTrue(format.contains(" warning: Something is not quite right"))
    }

    func test_outputError() {
        let message = "Something is really wrong"
        let format = Log.error(message)
        
        XCTAssertTrue(format.contains(" error: Something is really wrong"))
    }
}
