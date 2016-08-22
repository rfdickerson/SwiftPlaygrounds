//: [Previous](@previous)

import Foundation
import Dispatch

// ## Hello World
let queue = DispatchQueue(label: "Some queue",
                          qos: .userInitiated,
                          attributes: .concurrent)

let semaphore = DispatchSemaphore( value: 1 )

let myList: [Double] = [2,3,4,5,6,7,8,16,3,7,9]

// handle f's that throw
// and get back a Future/Async Outcome

extension Array {
    
    func parallelMap<T> (defaultValue: T, _ f: @escaping (Element) -> T, oncompletion: @escaping ([T])->Void) {
        
        var newValues = [T](repeating: defaultValue, count: self.count)
        
        for (i, e) in enumerated() {
            
            queue.async {
                
                let x = f(e)
                semaphore.wait()
                newValues[i] = x
                semaphore.signal()
            }
            
        }
        
        queue.async(flags: .barrier) {
            oncompletion( newValues )
        }
        
        
        
    }
    
    
    
}

let double = { (x: Int) -> Int in return 2*x }

myList.parallelMap(defaultValue: 0.0, sin) {
    values in
    print(values)
    values
}



//: [Next](@next)
