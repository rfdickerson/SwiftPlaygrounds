//: [Previous](@previous)
import AppKit
import Foundation


/*: Return Colors from Strings
### FlatMap is Cool!
 
*/

/**
 - parameters:
   - a: Color name
*/
func getColor(_ a: String) -> NSColor? {
    switch a {
        case "red"    : return NSColor.red
        case "blue"   : return NSColor.blue
        case "yellow" : return NSColor.yellow
        default       : return nil
    }
}

let colors = ["red", "blue", "green", "yellow"]

let result = colors.flatMap{ getColor($0) }




//: [Next](@next)
