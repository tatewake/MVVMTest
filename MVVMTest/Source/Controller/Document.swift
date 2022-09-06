import Cocoa

class Document: NSDocument {
    var model = Model(contentString: "")

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return false
    }

    override func makeWindowControllers() {
        addWindowController(StoryboardScene.Main.windowController.instantiate())
    }

    override func data(ofType _: String) throws -> Data {
        return model.data()!
    }

    override func read(from data: Data, ofType _: String) throws {
        model.read(from: data)
    }
}
