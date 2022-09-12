import Cocoa

class ViewController: NSViewController {
    @IBOutlet private var textView: NSTextView!
    private var viewModel = ViewModel()

    var document: Document? {
        return (windowController as? WindowController)?.document as? Document
    }

    func transform(_ string: String) -> String {
        return string
    }

    override func viewWillAppear() {
        viewModel.configure(modelProxy: document?.model, textView: textView, transform: transform)
    }

    func textView(_ textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        switch commandSelector {
        case #selector(NSResponder.insertTab(_:)):
            textView.window?.selectNextKeyView(nil)
            return true
        case #selector(NSResponder.insertBacktab(_:)):
            textView.window?.selectPreviousKeyView(nil)
            return true
        default:
            return false
        }
    }
}

extension ViewController: NSTextViewDelegate {
    func textDidChange(_: Notification) {
        (windowController as? WindowController)?.commitChangeText(contentString: transform(textView.string))
    }
}
