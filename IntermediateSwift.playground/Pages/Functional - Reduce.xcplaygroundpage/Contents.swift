

//: [Previous](@previous)

// Functional patterns

import Foundation

let array = [3,4,5,6,7]


let sum = array.reduce(0,{$0 + $1})

extension Array where Element : Integer {
    
    func foo() {}
    func doubled () -> [Element] { return self.map { 2*$0 } }
}


array.doubled()

// result





