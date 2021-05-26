//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol DisplayNameDelegate {
    func displayName(name: String)
}

struct Person {
    var firstName = "" {
        didSet {
            displayNameDelegate.displayName(getFullName())
        }
    }
    var lastName = "" {
        didSet {
            displayNameDelegate.displayName(getFullName())
        }
    }
    var displayNameDelegate: DisplayNameDelegate
    
    init(displayNameDelegate: DisplayNameDelegate) {
        self.displayNameDelegate = displayNameDelegate
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
    
}

struct MyDisplayNameDelegate: DisplayNameDelegate {
    
    func displayName(name: String) {
        print("Name: \(name)")
    }
}

var displayDelegate = MyDisplayNameDelegate()
var person = Person(displayNameDelegate: displayDelegate)

person.firstName = "Jon"
person.lastName = "Hoffman"
