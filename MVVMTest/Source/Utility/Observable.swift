import Foundation

final class Observable<T> {
    typealias Closure = (T) -> Void
    private var closure: Closure?

    var value: T {
        didSet {
            closure?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: Closure?) {
        self.closure = closure
        self.closure?(value)
    }

    func unbind() {
        closure = nil
    }
}
