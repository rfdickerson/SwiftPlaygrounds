//: [Previous](@previous)

import Foundation


infix operator |> { associativity left precedence 140 }
func |> <S,T> (value: S, f: (S) -> T) -> T{
    return f(value)
}

struct Person {
    let name: String
    init(name: String) {
        self.name = name
    }
}

let newperson = "Fred" |> Person.init(name:)


newperson.name

//: [Next](@next)
