//: [Previous](@previous)

import Foundation
import Dispatch

var str = "Hello, playground"

let queue = DispatchQueue(label: "Some queue",
                          attributes: .concurrent)



final class Counter {
    let semaphore = DispatchSemaphore( value: 1 )
    
    var value = 0

    func incrementValue() -> Int {
        defer { semaphore.signal() }
        semaphore.wait()
        value += 1
        return value
    }
    
}

let mycounter = Counter()

func doSomething(a: Int, oncompletion: @escaping (Int) -> Void) {
    
    queue.async {
        let newValue = mycounter.incrementValue()
        oncompletion(newValue)
    }
    
}


for _ in 0..<200 {
    doSomething(a: 5) {
        value in
        print(value)
    }
}

print("Shared counter is \(mycounter.incrementValue())")
//: [Next](@next)
