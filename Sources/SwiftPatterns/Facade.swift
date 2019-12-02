class ClothesStore {
    func buyClothers() -> String {
        return "clothes"
    }
}

class SnakesStore {
    func buySnakes() -> String {
        return "snakes"
    }
}

class TshirtStore {
    func buyTshirt() -> String {
        return "t-shirt"
    }
}


class WearMarket{
    private let clothesStore = ClothesStore()
    private let snakesStore = SnakesStore()
    private let tShirtStore = TshirtStore()
    
    func buyWear() -> String {
        return clothesStore.buyClothers() + ", " + snakesStore.buySnakes() + ", " + tShirtStore.buyTshirt()
    }
}
