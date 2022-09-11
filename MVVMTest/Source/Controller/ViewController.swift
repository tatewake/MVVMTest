import Cocoa

class ViewController: NSViewController {
    @IBOutlet private var textView: NSTextView!
    private var viewModel: ViewModel?

    var document: Document? {
        return (windowController as? WindowController)?.document as? Document
    }

    override func viewWillAppear() {
        viewModel = ViewModel(modelProxy: document?.model, textView: textView)
    }
}

extension ViewController: NSTextViewDelegate {
    func textDidChange(_: Notification) {
        (windowController as? WindowController)?.setContentString(contentString: textView.string)
    }
}
