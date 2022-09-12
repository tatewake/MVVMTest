import Cocoa

class ReverseViewController: ViewController {
    override func transform(_ string: String) -> String {
        return String(string.reversed())
    }
}
