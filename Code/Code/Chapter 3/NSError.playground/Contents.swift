//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


enum DrinkSize {
    case Can12
    case Can16
    case Can24
    case Can32
}

struct ErrorConstants {
    static let ERROR_DOMAIN = "com.masteringswift.nserrorexample"
    
    static let ERROR_INSUFFICENT_VOLUME = 200
    static let ERROR_TOO_HOT = 201
    static let ERROR_TOO_COLD = 202
}


struct Drink {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    mutating func drinking(amount: Double, error: NSErrorPointer) -> Bool {
        guard amount < volume else {
            error.memory = NSError(
                domain: ErrorConstants.ERROR_DOMAIN,
                code: ErrorConstants.ERROR_INSUFFICENT_VOLUME,
                userInfo: ["Error reason":"Not enough volume for drink"])
            return false
        }
        volume -= amount
        return true
    }
    mutating func temperatureChange(change: Double, error: NSErrorPointer) -> Bool {
        temperature += change
        guard temperature > 35 else {
            error.memory = NSError(
                domain: ErrorConstants.ERROR_DOMAIN,
                code: ErrorConstants.ERROR_TOO_COLD,
                userInfo: ["Error reason":"Drink too cold"])
            return false
        }
        guard temperature < 45 else {
            error.memory = NSError(
                domain: ErrorConstants.ERROR_DOMAIN,
                code: ErrorConstants.ERROR_TOO_HOT,
                userInfo: ["Error reason":"Drink too warm"])
            return false
        }
        return true
    }
}


var myDrink = Drink(volume: 23.5, caffeine: 280,
    temperature: 38.2, drinkSize: DrinkSize.Can24,
    description: "Drink Structure")

var myError: NSError?
if myDrink.drinking(50.0, error: &myError) {
    print("Had a drink")
} else {
    print("Error: \(myError?.code)")
}


var results = myDrink.temperatureChange(-5, error: &myError)
if !results {
    if myError?.code == ErrorConstants.ERROR_TOO_HOT {
        print("Drink too hot")
    } else {
        print("Drink too cold")
    }
    print("Error: \(myError)")
}
