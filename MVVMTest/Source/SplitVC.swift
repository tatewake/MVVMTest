import Cocoa

class SplitVC: NSSplitViewController {
    private var delegates = MulticastDelegate<ModelDelegate>()

    private var firstVC: ViewController {
        return splitViewItems.first!.viewController as! ViewController
    }

    private var secondVC: ViewController {
        return splitViewItems.last!.viewController as! ViewController
    }

    override func viewWillAppear() {
        super.viewWillAppear()

        delegates.add(firstVC)
        delegates.add(secondVC)

        (windowController as! WindowController).finishLoading()
    }

    deinit {
        delegates.remove(firstVC)
        delegates.remove(secondVC)
    }
}

extension SplitVC: ModelDelegate {
    func initialize() {
        delegates.invoke { $0.initialize() }
    }

    func stringChanged() {
        delegates.invoke { $0.stringChanged() }
    }
}
