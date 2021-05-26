//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum DrinkSize {
    case Can12
    case Can16
    case Can24
    case Can32
}

class Drink {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    init(volume: Double, caffeine: Double,
        temperature: Double, drinkSize: DrinkSize) {
            self.volume = volume
            self.caffeine = caffeine
            self.temperature = temperature
            self.description = "Drink base class"
            self.drinkSize = drinkSize
    }
    
    func drinking(amount: Double) {
        volume -= amount
    }
    func temperatureChange(change: Double) {
        temperature += change
    }
}

class Jolt: Drink {

    init(temperature: Double) {
        super.init(volume: 23.5, caffeine: 280,
            temperature: temperature, drinkSize: DrinkSize.Can24)
        self.description = "Jolt energy drink"
    }
}

class CaffeineFreeDietCoke: Drink {
    init(volume: Double, temperature: Double, drinkSize: DrinkSize) {
        super.init(volume: volume, caffeine: 0,
            temperature: temperature, drinkSize: drinkSize)
        self.description = "Caffiene Free Diet Coke"
    }
}

class DietCoke: Drink {
    init(volume: Double, temperature: Double, drinkSize: DrinkSize) {
        super.init(volume: volume, caffeine: 45,
            temperature: temperature, drinkSize: drinkSize)
        self.description = "Diet Coke"
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


let jolt = cooler.removeDrink()
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


//Problem with Reference types
var jolts = [Drink]()

var myJolt = Jolt(temperature: 48)
for _ in 0...5 {
    jolts.append(myJolt)
}

jolts[0].drinking(10)

for (index,can) in jolts.enumerate(){
    print("Can \(index) amount Left: \(can.volume)")
}


