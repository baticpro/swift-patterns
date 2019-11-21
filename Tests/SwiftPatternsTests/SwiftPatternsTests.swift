import XCTest
@testable import SwiftPatterns

final class SwiftPatternsTests: XCTestCase {
    func testStrategy() {
        let johnHero = Hero(fightB: FistFighter(), jumpB: HighJumper())
        let weakHero = Hero(fightB: HammerFighter(), jumpB: NonJumper())
        
        XCTAssertEqual(johnHero.performJump(), "high jump")
        XCTAssertEqual(weakHero.perfromFight(), "fight by hammer")
    }
    
    func testObserver() {
        let managerVasya = ProjectManager()
        let developerIvan = Developer()
        let designerKatya = Developer()

        managerVasya.add(observer: designerKatya)
        managerVasya.add(observer: developerIvan)

        managerVasya.message(taskText: "let provide hotfix!")
        
        XCTAssertEqual(developerIvan.getCurrentTask(), "let provide hotfix!")
        XCTAssertEqual(designerKatya.getCurrentTask(), "let provide hotfix!")
    }

    static var allTests = [
        ("testStrategy", testStrategy),
        ("testObserver", testObserver),
    ]
}
