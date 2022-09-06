import Foundation

class MulticastDelegate<T> {
    private let delegates: NSHashTable<AnyObject> = NSHashTable.weakObjects()

    func add(_ delegate: T?) {
        if let delegate = delegate {
            delegates.add(delegate as AnyObject)
        }
    }

    func remove(_ delegateToRemove: T?) {
        if let delegateToRemove = delegateToRemove {
            for delegate in delegates.allObjects.reversed() where delegate === delegateToRemove as AnyObject {
                delegates.remove(delegate)
                break
            }
        }
    }

    func invoke(_ invocation: (T) -> Void) {
        for delegate in delegates.allObjects.reversed() {
            invocation(delegate as! T)
        }
    }
}
