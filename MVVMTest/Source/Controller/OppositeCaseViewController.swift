import Cocoa

class OppositeCaseViewController: ViewController {
    override func transform(_ string: String) -> String {
        var result = ""

        for c in string {
            if c.isLowercase {
                result.append(c.uppercased())
            } else if c.isUppercase {
                result.append(c.lowercased())
            } else {
                result.append(c)
            }
        }

        return result
    }
}
