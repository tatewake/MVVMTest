import Cocoa

class SplitVC: NSSplitViewController {
    private var firstVC: ViewController {
        return splitViewItems.first!.viewController as! ViewController
    }

    private var secondVC: ViewController {
        return splitViewItems.last!.viewController as! ViewController
    }
}
