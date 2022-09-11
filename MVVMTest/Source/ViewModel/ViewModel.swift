import Cocoa

class ViewModel {
    private weak var modelProxy: ModelProxy?
    private var contentString = Box<String>("")

    init(modelProxy: ModelProxy?, textView: NSTextView) {
        contentString.bind {
            if textView.string != $0 {
                textView.string = $0
            }
        }

        if let modelProxy = modelProxy {
            self.modelProxy = modelProxy

            self.modelProxy?.delegates.add(self)
            self.modelProxy?.requestInitialize(delegate: self)
        }
    }

    deinit {
        modelProxy?.delegates.remove(self)
    }
}

extension ViewModel: ModelDelegate {
    func initialize(contentString: String) {
        self.contentString.value = contentString
    }

    func stringChanged(contentString: String) {
        self.contentString.value = contentString
    }
}
