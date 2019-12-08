protocol State {
    func idle(character: SomeCharacter)
    func go(character: SomeCharacter)
    func jump(character: SomeCharacter)
    func toString() -> String
}

class IdleState: State {
    func idle(character: SomeCharacter) {
        
    }
    
    func go(character: SomeCharacter) {
        character.setState(s: GoState())
    }
    
    func jump(character: SomeCharacter) {
        character.setState(s: JumpState())
    }
    
    func toString() -> String {
        return "idle"
    }
}

class GoState: State {
    func idle(character: SomeCharacter) {
        character.setState(s: IdleState())
    }
    
    func go(character: SomeCharacter) {
        
    }
    
    func jump(character: SomeCharacter) {
        character.setState(s: JumpState())
    }
    
    func toString() -> String {
        return "going"
    }
}

class JumpState: State {
    func idle(character: SomeCharacter) {
        character.setState(s: IdleState())
    }
    
    func go(character: SomeCharacter) {
         character.setState(s: IdleState())
    }
    
    func jump(character: SomeCharacter) {
       
    }
    
    func toString() -> String {
        return "jumping"
    }
}

class SomeCharacter {
    var state: State
    
    init() {
        state = IdleState()
    }
    
    func setState(s: State) {
        self.state = s
    }
    
    func performGo() {
        state.go(character: self)
    }
    
    func performJump() {
        state.jump(character: self)
    }
    
    func performIdle() {
        state.idle(character: self)
    }
}
