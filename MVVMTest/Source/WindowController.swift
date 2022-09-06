import Cocoa

class WindowController: NSWindowController {
    func sharedInit() {
        shouldCascadeWindows = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        sharedInit()
    }

    override init(window: NSWindow?) {
        super.init(window: window)

        sharedInit()
    }

    func setContentString(contentString: String) {
        if let document = document as? Document {
            document.model.setContentString(contentString: contentString)
            document.updateChangeCount(.changeDone)
            setDocumentEdited(true)
        }
    }
}
