import Combine


public class BagContainer {
    public var cancellableBag: Set<AnyCancellable> = Set()

    deinit {
        cancellableBag.forEach({$0.cancel()})
    }
}


