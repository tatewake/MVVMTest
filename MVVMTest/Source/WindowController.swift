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
            let undoContentString = document.model.getContentString()

            document.undoManager?.setActionName("change text")
            document.undoManager?.registerUndo(withTarget: self, handler: { _ in
                self.setContentString(contentString: undoContentString)
            })

            document.model.setContentString(contentString: contentString)
        }
    }
}
