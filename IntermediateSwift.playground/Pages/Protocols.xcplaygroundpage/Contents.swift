//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


protocol Hittable {

    mutating func hit(_ weapon: Weapon)
    
    var damage: Double { get set }
    
}

protocol Weapon {
    
    var strength: Double { get }
    
}

struct Sword: Weapon {
    
    let strength: Double = 0.2
    
}

struct IceBlock : Hittable {
    
    var x: Int = 0
    var y: Int = 0
    
    var damage: Double = 0.0
    
}

// Default behavior
extension Hittable {
    
    mutating func hit(_ weapon: Weapon) {
        print("Hit block")
        
        if damage < 1 { damage += weapon.strength }
    }
    
}

var ice = IceBlock()
var sword = Sword()

ice.hit(sword)
ice.hit(sword)
ice.hit(sword)
ice.damage

//: [Next](@next)

