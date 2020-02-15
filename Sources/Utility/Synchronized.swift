//
//  File.swift
//  
//
//  Created by Alex on 15.02.2020.
//

import Foundation


@propertyWrapper
public struct Synchronized<Value> {
    private var _value: Value
    private let lock = NSLock()

    public var wrappedValue: Value {
        get {
            lock.lock(); defer { lock.unlock() }
            return _value
        }
        set {
            lock.lock(); defer { lock.unlock() }
            _value = newValue
        }
    }

    public init(wrappedValue: Value) {
        lock.lock(); defer { lock.unlock() }
        self._value = wrappedValue
    }
}

