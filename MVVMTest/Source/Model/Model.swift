import Cocoa

protocol ModelDelegate: AnyObject {
    func initialize(contentString: String)
    func stringChanged(contentString: String)
}

protocol ModelProxy: AnyObject {
    var delegates: MulticastDelegate<ModelDelegate> { get }
    var contentString: String { get set }

    func requestInitialize(delegate: ModelDelegate)
}

class Model {
    internal var delegates = MulticastDelegate<ModelDelegate>()
    internal var contentString = "" {
        didSet {
            delegates.invoke { $0.stringChanged(contentString: contentString) }
        }
    }

    init(contentString: String) {
        self.contentString = contentString
    }

    func read(from data: Data) {
        contentString = String(bytes: data, encoding: .utf8) ?? ""
    }

    func data() -> Data? {
        return contentString.data(using: .utf8)
    }
}

extension Model: ModelProxy {
    func requestInitialize(delegate: ModelDelegate) {
        delegate.initialize(contentString: contentString)
    }
}
