protocol EditorCommand {
    func execute(text: String) -> String
}

class AddLineCommand: EditorCommand{
    func execute(text: String) -> String {
        return text + "\n"
    }
}

class AddHiCommand: EditorCommand{
    func execute(text: String) -> String {
        return text + " - Hi"
    }
}

class TextEditor {
    private var _commands: [EditorCommand] = []
    private var _resultingText: String = ""
    
    func getResut() -> String {
        return _resultingText
    }
    
    func addCommand(command: EditorCommand) {
        _commands.append(command)
    }
    
    func exucteCommands() {
        _commands.forEach { (c) in
            _resultingText = c.execute(text: _resultingText)
        }
    }
}
