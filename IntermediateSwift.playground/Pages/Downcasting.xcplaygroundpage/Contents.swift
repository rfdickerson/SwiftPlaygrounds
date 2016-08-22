//: [Previous](@previous)

import Foundation


// Downcasting

enum DataType {
    case string
    case integer
    case double
}

let a = "Hello"

func getType(_ item: Any) -> DataType? {
    
    switch item {
    case _ as Int       : return .integer
    case _ as String    : return .string
    case _ as Double    : return .double
    default             : return nil
    }
    
}

getType(3)
getType("Bob")
getType(5.6)

//: [Next](@next)
