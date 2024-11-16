import Foundation

public class ObservableObject<T> {

    public var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    public func bind(_ listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
