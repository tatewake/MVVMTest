import Cocoa

class WindowController: NSWindowController {
    var vc: SplitVC {
        return contentViewController as! SplitVC
    }

    func finishLoading() {
        if let document = document as? Document {
            document.model.addDelegate(delegate: vc)
            vc.stringChanged()
        }
    }

    func sharedInit() {
        shouldCascadeWindows = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        sharedInit()
    }

    override init(window: NSWindow?) {
        super.init(window: window)

        sharedInit()
    }

    deinit {
        if let document = document as? Document {
            document.model.removeDelegate(delegate: vc)
        }
    }

    func setContentString(contentString: String) {
        if let document = document as? Document {
            document.model.setContentString(contentString: contentString)
            document.updateChangeCount(.changeDone)
            setDocumentEdited(true)
        }
    }
}
