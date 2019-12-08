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
    
    func testFacade()
    {
        let wm = WearMarket()
        XCTAssertEqual(wm.buyWear(), "clothes, snakes, t-shirt")
    }
    
    func testTemplateMethod()
    {
        let mobile = MobileSmartPhone()
        let cell = CellPhone()
        
        XCTAssertEqual(mobile.processCall(), "unlocked by touchID, tapped to screen, tapped to green button")
        XCTAssertEqual(cell.processCall(), "don't need unlock, rolling circle, waiting after input")
    }
    
    func testIterator()
    {
        let playerA = FootballPlayer(name: "player A", isGoolKeeper: true)
        let playerB = FootballPlayer(name: "player B", isGoolKeeper: false)
        let playerC = FootballPlayer(name: "player C", isGoolKeeper: false)
        let playerD = FootballPlayer(name: "player D", isGoolKeeper: true)
        let playerF = FootballPlayer(name: "player F", isGoolKeeper: false)
        let playerH = FootballPlayer(name: "player H", isGoolKeeper: false)

        let team = FootballTeam()
        team.addPlayer(player: playerA)
        team.addPlayer(player: playerB)
        team.addPlayer(player: playerC)
        team.addPlayer(player: playerD)
        team.addPlayer(player: playerF)
        team.addPlayer(player: playerH)

        let iterator = team.makeGoolkeepersIterator()
        
        XCTAssertEqual(iterator.next()?.name, "player A")
        XCTAssertEqual(iterator.next()?.name, "player D")
        XCTAssertEqual(iterator.next()?.name, nil)
    }
    
    func testComposite()
    {
        let parent = ParentCategory(deep: 0)
        let child1 = ChildrenCategory(deep: 1)
        let child2 = ChildrenCategory(deep: 2)

        parent.addChildren(c: child1)
        parent.addChildren(c: child2)

        XCTAssertEqual(parent.printContents(), "category - 1 category - 2")
    }
    
    func testState()
    {
        let character = SomeCharacter()
        character.performGo()
        
        character.performIdle()
        XCTAssertEqual(character.state.toString(), "idle")
        
        character.performJump()
        XCTAssertEqual(character.state.toString(), "jumping")
    }

    static var allTests = [
        ("testStrategy", testStrategy),
        ("testObserver", testObserver),
        ("testDecorator", testDecorator),
    ]
}
