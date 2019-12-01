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
    
    func testSingleton() {
        let single = SomeSingleton.shared
        single.someValue = 10
        
        SomeSingleton.shared.someValue += 20
        
        XCTAssertEqual(single.someValue, 30)
    }
    
    func testAbstractFactory() {
        let cheapComputerFactory = CheapComputerFactory()
        
        let ram = cheapComputerFactory.produceRam()
        let display = cheapComputerFactory.produceDisplay()
        
        XCTAssertEqual(ram.getSize(), "16GB")
        XCTAssertEqual(display.getSize(), "1280x720")
    }
    
    func testCommand() {
        let addCommand = AddLineCommand()
        let hiCommand = AddHiCommand()

        let textEditor = TextEditor()

        textEditor.addCommand(command: addCommand)
        textEditor.addCommand(command: hiCommand)

        textEditor.exucteCommands()
        
        XCTAssertEqual(textEditor.getResut(), "\n - Hi")
    }
    
    func testAdapter()
    {
        let cassetPlayer = OldCassetPlayer()
        let adaptee = OldCassetAdapter(oldCasset: cassetPlayer)
        
        XCTAssertEqual(adaptee.playMusic(), "playing casset")
    }

    static var allTests = [
        ("testStrategy", testStrategy),
        ("testObserver", testObserver),
        ("testDecorator", testDecorator),
    ]
}
