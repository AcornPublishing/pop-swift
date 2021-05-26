//: Playground - noun: a place where people can play

import UIKit


//Notification Center Example
let NCNAME = "Notification Name"

class PostType {
    let nc = NSNotificationCenter.defaultCenter()
    
    func post() {
        nc.postNotificationName(NCNAME, object: nil)
    }
}

class ObserverType {
    let nc = NSNotificationCenter.defaultCenter()
    
    init() {
        nc.addObserver(self, selector: "receiveNotification:", name: NCNAME, object: nil)
    }
    
    @objc func receiveNotification(notification: NSNotification) {
        print("Notification  Received")
    }
}

var postType = PostType()
var observerType = ObserverType()
postType.post()


//Observer type Example
protocol ZombieObserverProtocol {
    func turnLeft()
    func turnRight()
    func seesUs()
}

class MyObserver: ZombieObserverProtocol {
    func turnLeft() {
        print("Zombie turned left, we move right")
    }
    func turnRight() {
        print("Zombie turned right, we move left")
    }
    func seesUs() {
        print("Zombie sees us, RUN!!!!")
    }
}

struct Zombie {
    var observer: ZombieObserverProtocol
    
    func turnZombieLeft() {
        //Zombie turns left
        //Notify observer
        observer.turnLeft()
    }
    func turnZombieRight() {
        //Zombie turns right
        //Notify observer
        observer.turnRight()
    }
    func spotHuman() {
        //Zombie sees us
        //Notify observer
        observer.seesUs()
    }
}

var observer = MyObserver()
var zombie = Zombie(observer: observer)

zombie.turnZombieLeft()
zombie.spotHuman()


//Property Observer Example
protocol PropertyObserverProtocol {
    func propertyChanged(propertyName: String, newValue: Any)
}

class MyObserverType: PropertyObserverProtocol {
    func propertyChanged(propertyName: String, newValue: Any) {
        print("----changed----")
        print("Property Name: \(propertyName)")
        print("New Value:  \(newValue)")
    }
}

struct PropertyObserver {
    var observer: PropertyObserverProtocol
    var property1: String {
        didSet{
            observer.propertyChanged("property1", newValue: property1)
        }
        willSet(newValue) {
            print("Property Changing")
        }
    }
}

var myObserver = MyObserverType()
var p = PropertyObserver(observer: myObserver, property1: "Initial String")
p.property1 = "My String"