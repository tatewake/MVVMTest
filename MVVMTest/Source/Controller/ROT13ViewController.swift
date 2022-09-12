import Cocoa

class ROT13ViewController: ViewController {
    private static var key = [Character: Character]()

    private static let uppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private static let lowercase = Array("abcdefghijklmnopqrstuvwxyz")

    override func transform(_ string: String) -> String {
        if ROT13ViewController.key.isEmpty {
            for i in 0 ..< 26 {
                ROT13ViewController.key[ROT13ViewController.uppercase[i]] = ROT13ViewController.uppercase[(i + 13) % 26]
                ROT13ViewController.key[ROT13ViewController.lowercase[i]] = ROT13ViewController.lowercase[(i + 13) % 26]
            }
        }

        return String(string.map { ROT13ViewController.key[$0] ?? $0 })
    }
}
