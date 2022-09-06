import Cocoa

// From: https://stackoverflow.com/questions/5711367/os-x-how-can-a-nsviewcontroller-find-its-window

public extension NSViewController {
    var windowController: NSWindowController? {
        return ((isViewLoaded == false ? nil : view)?.window?.windowController) ?? parent?.windowController
    }
}
