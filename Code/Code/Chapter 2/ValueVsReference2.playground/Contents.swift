//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//  Throws an error because we can not create 
//  A linked list from a value type
/*
struct LinkedListValueType {
    var value: String
    var next: LinkedListValueType?
}
*/

class LinkedListReferenceType {
    var value: String
    var next: LinkedListReferenceType?
    
    init(value: String) {
        self.value = value
    }
}



