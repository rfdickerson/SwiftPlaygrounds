//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let a = (2, "hello")

switch a {
case (let x, _) where x > 3:
    print("bigger than three")
case (_, let s) where s == "hello":
    print("hello there")
default:
    print ("something else")
}