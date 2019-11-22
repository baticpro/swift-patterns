protocol AppleProduct {
    func getPrice() -> Int
    func getName() -> String
}

class IPhone: AppleProduct {
    func getPrice() -> Int {
        return 150
    }
    
    func getName() -> String {
        return "this is iPhone"
    }
}

class AppleDecorator: AppleProduct {
    private var decoratedProduct: AppleProduct
    
    required init(dP: AppleProduct) {
        self.decoratedProduct = dP
    }
    
    func getPrice() -> Int {
        return decoratedProduct.getPrice()
    }
    
    func getName() -> String {
        return decoratedProduct.getName()
    }
}

class SuperRetinaDisplay: AppleDecorator {
    let displayPrice = 500
    
    required init(dP: AppleProduct) {
        super.init(dP: dP)
    }
    
    override func getPrice() -> Int {
        return super.getPrice() + self.displayPrice
    }
    
    override func getName() -> String {
        return super.getName() + " with retina super display"
    }
}

class NewestGreenColor: AppleDecorator {
    let colorPrice = 1500
    
    required init(dP: AppleProduct) {
        super.init(dP: dP)
    }
    
    override func getPrice() -> Int {
        return super.getPrice() + self.colorPrice
    }
    
    override func getName() -> String {
        return super.getName() + " colored by newest green"
    }
}
