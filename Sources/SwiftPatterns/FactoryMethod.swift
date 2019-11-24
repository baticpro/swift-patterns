protocol Gadgets {
    func getName() -> String
}

class MobilePhone: Gadgets {
    func getName() -> String {
        return "this is a mobile phone"
    }
}

class Tablet: Gadgets {
    func getName() -> String {
        return "this is a table"
    }
}

protocol GadgetFactory {
    func produce() -> Gadgets
}

class MobilePhoneFactory: GadgetFactory {
    func produce() -> Gadgets {
        return MobilePhone()
    }
}

class TabletFactory: GadgetFactory {
    func produce() -> Gadgets {
        return Tablet()
    }
}
