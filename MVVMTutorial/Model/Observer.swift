//
//  Observer.swift
//  MVVMTutorial
//
//  Created by MacBook Pro on 03/04/2024.
//

import Foundation

class Observer<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {listener?(value)}
    }
    
    init (value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        listener = closure
        listener?(value)
    }
}
