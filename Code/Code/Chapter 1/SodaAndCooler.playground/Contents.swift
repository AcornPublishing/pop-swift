//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



class Jolt {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var canSize: Double
    var description: String
    
    init(volume: Double, caffeine: Double,
        temperature: Double) {
            self.volume = volume
            self.caffeine = caffeine
            self.temperature = temperature
            self.description = "Jolt energy drink"
            self.canSize = 24
    }
    
    func drinking(amount: Double) {
        volume -= amount
    }
    func temperatureChange(change: Double) {
        self.temperature += change
    }
}


class Cooler {
    var temperature: Double
    var cansOfJolt = [Jolt]()
    var maxCans: Int
    
    init(temperature: Double, maxCans: Int) {
        self.temperature = temperature
        self.maxCans = maxCans
    }
    
    func addJolt(jolt: Jolt) -> Bool {
        if cansOfJolt.count < maxCans {
            cansOfJolt.append(jolt)
            return true
        } else {
            return false
        }
    }
    
    func removeJolt() -> Jolt? {
        if cansOfJolt.count > 0 {
            return cansOfJolt.removeFirst()
        } else {
            return nil
        }
    }
}


var cooler = Cooler(temperature: 38.0, maxCans: 24)

for _ in 0...5 {
    let can = Jolt(volume: 23.5, caffeine: 280,
        temperature: 45)
    let _ = cooler.addJolt(can)
}

let jolt = cooler.removeJolt()
cooler.cansOfJolt.count
jolt?.drinking(5)
print("Jolt Left in can: \(jolt?.volume)")
