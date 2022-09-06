import Cocoa

class ViewController: NSViewController {
    @IBOutlet private var textView: NSTextView!

    var document: Document {
        let wc = (windowController as! WindowController)
        return wc.document as! Document
    }
}

extension ViewController: ModelDelegate {
    func initialize() {
        textView.string = document.model.getContentString()
    }

    func stringChanged() {
        textView.string = document.model.getContentString()
    }
}

extension ViewController: NSTextViewDelegate {
    func textDidChange(_: Notification) {
        (windowController as! WindowController).setContentString(contentString: textView.string)
    }
}
