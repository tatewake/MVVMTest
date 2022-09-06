import Cocoa

class WindowController: NSWindowController {
    var vc: ViewController {
        return contentViewController as! ViewController
    }

    func finishLoading() {
        if let document = document as? Document {
            vc.textView.string = document.model.contentString
        }
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
}

extension WindowController: NSTextViewDelegate {
    func textDidChange(_: Notification) {
        if let document = document as? Document {
            document.model.contentString = vc.textView.string
            document.updateChangeCount(.changeDone)
            setDocumentEdited(true)
        }
    }
}
