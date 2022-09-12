import Cocoa

class WindowController: NSWindowController {
    private var outerSplitVC: NSSplitViewController {
        return contentViewController as! NSSplitViewController
    }

    private var innerSplitVC: NSSplitViewController {
        return outerSplitVC.splitViewItems.first!.viewController as! NSSplitViewController
    }

    private var firstVC: ViewController {
        return innerSplitVC.splitViewItems.first!.viewController as! ViewController
    }

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

    override func windowDidLoad() {
        firstVC.becomeFirstResponder()
    }

    func commitChangeText(contentString: String) {
        if let document = document as? Document {
            let undoContentString = document.model.contentString

            document.undoManager?.setActionName("change text")
            document.undoManager?.registerUndo(withTarget: self, handler: { _ in
                self.commitChangeText(contentString: undoContentString)
            })

            document.model.contentString = contentString
        }
    }
}
