// fighter
protocol FightBehavior {
    func fight() -> String
}

class FistFighter: FightBehavior {
    func fight() -> String {
        return "fight by fist"
    }
}

class HammerFighter: FightBehavior {
    func fight() -> String {
        return "fight by hammer"
    }
}

// jumper
protocol JumpBehavior {
    func jump() -> String
}

class HighJumper: JumpBehavior {
    func jump() -> String {
        return "high jump"
    }
}

class NonJumper: JumpBehavior {
    func jump() -> String {
        return "can't jump"
    }
}


class Hero {
    var fightBehavior: FightBehavior
    var jumpBehavior: JumpBehavior
    
    init(fightB: FightBehavior, jumpB: JumpBehavior) {
        fightBehavior = fightB
        jumpBehavior = jumpB
    }
    
    func perfromFight() -> String {
        return fightBehavior.fight()
    }
    
    func performJump() -> String {
        return jumpBehavior.jump()
    }
}
