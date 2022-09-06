import Cocoa

class ViewModel {
    var contentString = Box("")
}

extension ViewModel: ModelDelegate {
    func initialize(contentString: String) {
        self.contentString.value = contentString
    }

    func stringChanged(contentString: String) {
        self.contentString.value = contentString
    }
}
