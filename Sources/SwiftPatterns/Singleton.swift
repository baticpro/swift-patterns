class SomeSingleton {
    var someValue : Int = 0
    
    static let shared = SomeSingleton()
    
    private init() {}
}
