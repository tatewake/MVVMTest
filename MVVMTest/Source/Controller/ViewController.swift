import Cocoa

class ViewController: NSViewController {
    @IBOutlet private var textView: NSTextView!
    private var viewModel: ViewModel?

    var document: Document? {
        return (windowController as? WindowController)?.document as? Document
    }

    func transform(_ string: String) -> String {
        return string
    }

    override func viewWillAppear() {
        viewModel = ViewModel(modelProxy: document?.model, textView: textView, transform: transform)
    }
}

extension ViewController: NSTextViewDelegate {
    func textDidChange(_: Notification) {
        (windowController as? WindowController)?.commitChangeText(contentString: transform(textView.string))
    }
}
