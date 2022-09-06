import Cocoa

class Model: NSObject {
    var contentString = ""

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
