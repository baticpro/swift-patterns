import XCTest
@testable import SwiftPatterns

final class SwiftPatternsTests: XCTestCase {
    func testStrategy() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let johnHero = Hero(fightB: FistFighter(), jumpB: HighJumper())
        let weakHero = Hero(fightB: HammerFighter(), jumpB: NonJumper())
        
        XCTAssertEqual(johnHero.performJump(), "high jump")
        XCTAssertEqual(weakHero.perfromFight(), "fight by hammer")
    }

    static var allTests = [
        ("testStrategy", testStrategy),
    ]
}
