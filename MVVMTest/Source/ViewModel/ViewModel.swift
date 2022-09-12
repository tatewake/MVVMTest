import Cocoa

class ViewModel {
    private weak var modelProxy: ModelProxy?
    private var contentString = Observable<String>("")

    func configure(modelProxy: ModelProxy?, textView: NSTextView, transform: @escaping (String) -> String) {
        contentString.bind {
            let newValue = transform($0)

            if textView.string != newValue {
                textView.string = newValue
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
        contentString.unbind()
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
