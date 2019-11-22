protocol SomeProduct {
    func getSomething() -> String
}

enum SomeProductType {
    case normal, good, best
}

class BestSomeProduct: SomeProduct {
    func getSomething() -> String {
        return "best product"
    }
}

class GoodSomeProduct: SomeProduct {
    func getSomething() -> String {
        return "good product"
    }
}

class NormalSomeProduct: SomeProduct {
    func getSomething() -> String {
        return "normal product"
    }
}


class SomeProductFactory {
    static func createSomeProduct(type: SomeProductType) -> SomeProduct {
        switch type {
        case .best: return BestSomeProduct()
        case .good: return GoodSomeProduct()
        case .normal: return NormalSomeProduct()
        }
    }
}
