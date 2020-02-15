//
//  File.swift
//  
//
//  Created by Alex on 15.02.2020.
//

import Foundation
import Network
import Combine


public protocol ReachabilityManager {
    var reachable: CurrentValueSubject<Bool, Never> { get }
}


class DefaultReachabilityManager: ReachabilityManager {
    public let reachable: CurrentValueSubject<Bool, Never> = CurrentValueSubject(false)
    private let monitor = NWPathMonitor()

    public init() {
        print("unfortunately it is not works on watchos normally")
    }

    public func observeNetwork () {
        self.monitor.start(queue: .main)
        self.monitor.pathUpdateHandler = {[weak self] path in
            guard let self = self else { return }
            syncInMain {
                self.reachable.send(path.status == .satisfied)
            }
        }
    }

    deinit {
        self.monitor.cancel()
    }

}
