import XCTest
@testable import SwiftPatterns

final class SwiftPatternsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPatterns().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
