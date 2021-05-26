//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Plant {
    var height:Double = 0.0
    var description = "Plant"
    var age = 0
    func growHeight(inches: Double) {
        height += inches
    }
    func getDetails() -> String {
        return "Plant Height: \(height) age: \(age)"
    }
}

class Flower: Plant {
    var flowerColor: String
    var fullyBloomed: Bool
    
    init(flowerColor: String, fullyBloomed: Bool) {
        self.flowerColor = flowerColor
        self.fullyBloomed = fullyBloomed
        super.init()
        self.description = "Flower"
    }
    
    func blooming() {
        // code to make flower bloom
    }
    
    override func getDetails() -> String {
        return "Flower Height: \(height) age: \(age) color: \(flowerColor) fully bloomed:  \(fullyBloomed)"
    }
}

class Rose: Flower {
    var species: String
    var hasThorns: Bool
    
    init(species: String, hasThorns: Bool, color: String, fullyBloomed: Bool) {
        self.species = species
        self.hasThorns = hasThorns
        
        super.init(flowerColor: color, fullyBloomed: fullyBloomed)
        self.description = "Rose"
        
    }
}

class Carnation: Flower {
    var type: String
    init(type: String, color: String, fullyBloomed: Bool) {
        self.type = type
        
        super.init(flowerColor: color, fullyBloomed: fullyBloomed)
        self.description = "Carnation"
    }
}

