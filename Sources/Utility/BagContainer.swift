import Combine


open class BagContainer {
    public var cancellableBag: Set<AnyCancellable> = Set()

    public init() {}

    deinit {
        cancellableBag.forEach({$0.cancel()})
    }
}


