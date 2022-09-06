import Cocoa

class ViewController: NSViewController {
    @IBOutlet private var textView: NSTextView!
    private var viewModel = ViewModel()

    var document: Document? {
        return (windowController as? WindowController)?.document as? Document
    }

    override func viewWillAppear() {
        viewModel.contentString.bind { [self] in
            textView.string = $0
        }

        document?.model.addDelegate(delegate: viewModel)
    }

    deinit {
        document?.model.removeDelegate(delegate: viewModel)
    }
}

extension ViewController: NSTextViewDelegate {
    func textDidChange(_: Notification) {
        (windowController as? WindowController)?.setContentString(contentString: textView.string)
    }
}
