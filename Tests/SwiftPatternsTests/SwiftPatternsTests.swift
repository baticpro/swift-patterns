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
    
    func testDecorator() {
        var iPhone: AppleProduct = IPhone()
        iPhone = SuperRetinaDisplay(dP: iPhone)
        iPhone = NewestGreenColor(dP: iPhone)
        
        XCTAssertEqual(iPhone.getName(), "this is iPhone with retina super display colored by newest green")
    }
    
    func testSimpleFactory() {
        let normalProduct = SomeProductFactory.createSomeProduct(type: .normal)
        XCTAssertEqual(normalProduct.getSomething(), "normal product")
    }
    
    func testFactoryMethod() {
        let mobilePhoneFactory = MobilePhoneFactory()
        let mobile = mobilePhoneFactory.produce()
        
        XCTAssertEqual(mobile.getName(), "this is a mobile phone")
    }

    static var allTests = [
        ("testStrategy", testStrategy),
        ("testObserver", testObserver),
        ("testDecorator", testDecorator),
    ]
}
