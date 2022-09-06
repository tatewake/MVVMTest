import Cocoa

class ViewController: NSViewController {
    @IBOutlet var textView: NSTextView!

    override func viewWillAppear() {
        super.viewWillAppear()

        (windowController as! WindowController).finishLoading()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
