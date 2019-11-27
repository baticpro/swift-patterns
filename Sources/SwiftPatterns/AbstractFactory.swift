protocol DisplayMatrix {
    func getSize() -> String
}

class HdDisplay: DisplayMatrix {
    func getSize() -> String {
        return "1280x720"
    }
}

class FullHdDisplay: DisplayMatrix {
    func getSize() -> String {
        return "1920x1280"
    }
}

protocol FastRam {
    func getSize() -> String
}

class Ddr3Ram: FastRam{
    func getSize() -> String {
        return "16GB"
    }
}

class Ddr4Ram: FastRam{
    func getSize() -> String {
        return "32GB"
    }
}

protocol ComputerFactory {
    func produceDisplay() -> DisplayMatrix
    func produceRam() -> FastRam
}

class CheapComputerFactory: ComputerFactory {
    func produceDisplay() -> DisplayMatrix {
        return HdDisplay()
    }
    
    func produceRam() -> FastRam {
        return Ddr3Ram()
    }
}

class RichComputerFactory: ComputerFactory {
    func produceDisplay() -> DisplayMatrix {
        return FullHdDisplay()
    }
    
    func produceRam() -> FastRam {
        return Ddr4Ram()
    }
}
