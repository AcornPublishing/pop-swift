//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum DrinkSize {
    case Can12
    case Can16
    case Can24
    case Can32
}

struct Drink {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    mutating func drinking(amount: Double) {
        volume -= amount
    }
    mutating func temperatureChange(change: Double) {
        temperature += change
    }
}


var myDrink = Drink(volume: 23.5, caffeine: 280,
    temperature: 38.2, drinkSize: DrinkSize.Can24,
    description: "Drink Structure")