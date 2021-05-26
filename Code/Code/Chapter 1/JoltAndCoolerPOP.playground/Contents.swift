//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum DrinkSize {
    case Can12
    case Can16
    case Can24
    case Can32
}

protocol Drink {
    var volume: Double {get set}
    var caffeine: Double {get set}
    var temperature: Double {get set}
    var drinkSize: DrinkSize {get set}
    var description: String {get set}
}

extension Drink {
    mutating func drinking(amount: Double) {
        volume -= amount
    }
    mutating func temperatureChange(change: Double) {
        temperature += change
    }
}

struct Jolt: Drink {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    init(temperature: Double) {
        self.volume = 23.5
        self.caffeine = 280
        self.temperature = temperature
        self.description = "Jolt Energy Drink"
        self.drinkSize = DrinkSize.Can24
    }
    
}

struct CaffeineFreeDietCoke: Drink {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    init(volume: Double, temperature: Double,
        drinkSize: DrinkSize) {
        
            self.volume = volume
            self.caffeine = 0
            self.temperature = temperature
            self.description = "Caffiene Free Diet Coke"
            self.drinkSize = drinkSize
    }
}


struct DietCoke: Drink {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    init(volume: Double, temperature: Double, drinkSize: DrinkSize) {
        self.volume = volume
        self.caffeine = 45
        self.temperature = temperature
        self.description = "Diet Coke"
        self.drinkSize = drinkSize
    }
}

class Cooler {
    var temperature: Double
    var cansOfDrinks = [Drink]()
    var maxCans: Int
    
    init(temperature: Double, maxCans: Int) {
        self.temperature = temperature
        self.maxCans = maxCans
    }
    
    func addDrink(drink: Drink) -> Bool {
        if cansOfDrinks.count < maxCans {
            cansOfDrinks.append(drink)
            return true
        } else {
            return false
        }
    }
    
    func removeDrink() -> Drink? {
        if cansOfDrinks.count > 0 {
            return cansOfDrinks.removeFirst()
        } else {
            return nil
        }
    }
}


var cooler = Cooler(temperature: 38.0, maxCans: 24)

for _ in 0...5 {
    let can = Jolt(temperature: 45.1)
    let _ = cooler.addDrink(can)
}
for _ in 0...5 {
    let can = CaffeineFreeDietCoke(volume: 15.5, temperature: 45,
        drinkSize: DrinkSize.Can16)
    let _ = cooler.addDrink(can)
}

var jolt = cooler.removeDrink()
cooler.cansOfDrinks.count
jolt?.drinking(5)
print("Jolt Left in can: \(jolt?.volume)")

var foundCan = false
var wifeDrink: Drink?

while !foundCan {
    if let can = cooler.removeDrink() {
        if can is CaffeineFreeDietCoke {
            foundCan = true
            wifeDrink = can
        } else {
            cooler.addDrink(can)
        }
    }
}

if let drink = wifeDrink {
    print("Got: " + drink.description)
}

//Better with value types
var jolts = [Drink]()

var myJolt = Jolt(temperature: 48)
for _ in 0...5 {
    jolts.append(myJolt)
}

jolts[0].drinking(10)

for (index,can) in jolts.enumerate(){
    print("Can \(index) amount Left: \(can.volume)")
}

