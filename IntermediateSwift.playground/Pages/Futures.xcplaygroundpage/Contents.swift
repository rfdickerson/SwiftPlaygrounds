//: [Previous](@previous)

import Foundation
import Dispatch

enum Result<T> {
    case error(Error)
    case success(T)
}

class Promise<T> {
    
    var dispatchQueue: DispatchQueue
    
    var future: Future<T>
    
    init() {
        future = Future<T>()
        
        dispatchQueue = DispatchQueue(label: "promise",
                                      qos: .userInitiated,
                                      attributes: .concurrent)
    }
    
    func completeWithSuccess(value: T) {
        future.notify(.success(value))
    }
    
    func completeWithFail(error: Error) {
        future.notify(.error(error))
    }
    
}


class Future<T> {
    
    var dispatchQueue: DispatchQueue?
    var onCompletion: (@escaping (T)->Void)?
    var onFailure: (@escaping (Error)->Void)?
    
    public init() {
        
    }
    
    public func notify(_ value: Result<T>) {
        
        switch value {
        case .success(let a):
            dispatchQueue?.async {
                
                // do the work
                self.onCompletion?(a)
                
            }
        case .error(let error):
            
            self.onFailure?(error)
            
        }
        
        
        
    }
    
    
    public func onSuccess(qos: DispatchQoS,
                          completionHander: @escaping (T)->Void) -> Future<T> {
        
        onCompletion = completionHander
        dispatchQueue = DispatchQueue(label: "future", qos: qos, attributes: .concurrent)
        
        return self
    }
    
    public func onFailure(completionHander: @escaping (Error)->Void) -> Future<T> {
        
        onFailure = completionHander
        
        return self
    }
    
}


func getANumber(number: Int) -> Future<Int> {
    let p = Promise<Int>()
    
    p.dispatchQueue.async {
        sleep(1)
        p.completeWithSuccess(value: number * 3)
    }
    
    return p.future
}

struct NoCityFound: Error {}

func getCityTemperature(withName: String) -> Future<Double> {
    let p = Promise<Double>()
    
    p.dispatchQueue.async {
        
        if withName == "Austin" {
            sleep(1)
            p.completeWithSuccess(value: 98.6)
        } else {
            p.completeWithFail(error: NoCityFound())
        }
        
    }
    
    return p.future
}


let newNumber = getCityTemperature(withName: "Austin")
newNumber.onSuccess(qos: .userInitiated) { value in
    
    print(value)
    
    
}.onFailure { error in
        
    print(error)
}

sleep(2)

//: [Next](@next)
