import Cocoa

protocol ModelDelegate: AnyObject {
    func initialize(contentString: String)
    func stringChanged(contentString: String)
}

class Model {
    private var contentString = ""
    private var delegates = MulticastDelegate<ModelDelegate>()

    public init(contentString: String) {
        self.contentString = contentString
    }

    func addDelegate(delegate: ModelDelegate) {
        delegates.add(delegate)

        delegate.initialize(contentString: contentString)
    }

    func removeDelegate(delegate: ModelDelegate) {
        delegates.remove(delegate)
    }

    func read(from data: Data) {
        contentString = String(bytes: data, encoding: .utf8) ?? ""
    }

    func data() -> Data? {
        return contentString.data(using: .utf8)
    }

    func getContentString() -> String {
        return contentString
    }

    func setContentString(contentString: String) {
        self.contentString = contentString

        delegates.invoke { $0.stringChanged(contentString: contentString) }
    }
}
