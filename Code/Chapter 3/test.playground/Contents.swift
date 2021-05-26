//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum DrinkSize {
    case Can12
    case Can16
    case Can24
    case Can32
}

enum DrinkErrors: ErrorType {
    case insufficentVolume
    case tooHot
    case tooCold
}

struct Drink {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    mutating func drinking(amount: Double) throws {
        guard amount < volume else {
            throw DrinkErrors.insufficentVolume
        }
        volume -= amount
    }
    mutating func temperatureChange(change: Double) throws {
        temperature += change
        guard temperature > 35 else {
            throw DrinkErrors.tooHot
        }
        guard temperature < 45 else {
            throw DrinkErrors.tooCold
        }
    }
}

print(str)
