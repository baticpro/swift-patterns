protocol Category {
    var deep: Int {get}
    
    func addChildren(c: Category)
    func printContents() -> String
}

class ParentCategory: Category {
    private var children = [Category]()
    var deep: Int
    
    init(deep: Int) {
        self.deep = deep
    }
    
    func addChildren(c: Category) {
        children.append(c)
    }
    
    func printContents() -> String {
        var str = ""
        for child in children {
            str += child.printContents() + " "
        }
        
        return String(str.dropLast())
    }
}

class ChildrenCategory: Category {
    var deep: Int
    
    init(deep: Int) {
        self.deep = deep
    }
    
    internal func addChildren(c: Category) {
        
    }
    
    func printContents() -> String {
        return "category - \(self.deep.description)"
    }
}
