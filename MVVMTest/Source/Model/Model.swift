import Cocoa

protocol ModelDelegate: AnyObject {
    func initialize(contentString: String)
    func stringChanged(contentString: String)
}

protocol ModelProxy: AnyObject {
    var contentString: String { get set }
    var delegates: MulticastDelegate<ModelDelegate> { get }

    func requestInitialize(delegate: ModelDelegate)
}

class Model {
    internal var delegates = MulticastDelegate<ModelDelegate>()
    internal var contentString = "" {
        didSet {
            delegates.invoke { $0.stringChanged(contentString: contentString) }
        }
    }

    public init(contentString: String) {
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
