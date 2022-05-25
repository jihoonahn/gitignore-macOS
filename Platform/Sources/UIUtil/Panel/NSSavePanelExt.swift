import AppKit

public extension NSSavePanel{
    convenience init(nameFieldStringValue : String){
        self.init()
        self.nameFieldStringValue = nameFieldStringValue
        self.canCreateDirectories = true
        self.isExtensionHidden = false
        self.allowsOtherFileTypes = false
        self.message = "Quickly for projects you need. Create gitignore file"
        self.nameFieldLabel = "File name:"
    }
    //MARK: - Method
    func showSavePanel() -> URL? {
        let savePanel = NSSavePanel(nameFieldStringValue: ".gitignore")
        let response = savePanel.runModal()
        return response == .OK ? savePanel.url : nil
    }
}
