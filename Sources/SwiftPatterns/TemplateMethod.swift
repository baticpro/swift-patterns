class AbstractPhone {
    final func processCall() -> String {
        return unlock() + ", " + inputNumber() + ", " + startCall()
    }
    
    func unlock() -> String {
        return ""
    }
    
    func inputNumber() -> String {
        return ""
    }
    
    func startCall() -> String {
        return ""
    }
}

class MobileSmartPhone: AbstractPhone {
    override func unlock() -> String {
        return "unlocked by touchID"
    }
    
    override func inputNumber() -> String {
        return "tapped to screen"
    }
    
    override func startCall() -> String {
        return "tapped to green button"
    }
}

class CellPhone: AbstractPhone {
    override func unlock() -> String {
        return "don't need unlock"
    }
    
    override func inputNumber() -> String {
        return "rolling circle"
    }
    
    override func startCall() -> String {
        return "waiting after input"
    }
}
