//
//  File.swift
//  
//
//  Created by Alex on 15.02.2020.
//

import Foundation




public func abstractMethod() {
    fatalError("abstract method")
}


public func syncInMain(block: ()-> Void) {
    if (Thread.isMainThread) {
        block()
    } else {
        DispatchQueue.main.sync(execute: block)
    }
}
