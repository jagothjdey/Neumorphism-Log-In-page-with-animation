import XCTest
import ViewInspector

@testable import RandomListProject

extension ContentView: Inspectable { }

class ContentViewTests: XCTestCase {

    func testStringValue() throws {
        let sut = ContentView()
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "Hello, world!")
    }
}
