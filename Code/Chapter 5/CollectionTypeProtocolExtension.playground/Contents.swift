//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension CollectionType where Self: ArrayLiteralConvertible {
    func evenElements() -> [Generator.Element] {
        
        var index = self.startIndex
        var result: [Generator.Element] = []
        var i = 0
        repeat {
            if i % 2 == 0 {
                result.append(self[index])
            }
            index = index.successor()
            i++
        } while (index != self.endIndex)
        
        return result
    }
    
    func shuffle() -> [Self.Generator.Element] {
        return sort(){ left, right in
            return arc4random() < arc4random()
        }
    }
}



var origArray = [1,2,3,4,5,6,7,8,9,10]

var newArray = origArray.evenElements()
var ranArray = origArray.shuffle()


var origDict = [1:"One",2:"Two",3:"Three",4:"Four"]

//Dictionary does not confrom to the ArrayLiteralConvertible protocol
//therefore it does note receive the extension
/* 
var new = origDict.evenElements()

if new is Dictionary<Int,String> {
    print("is Dictionary")
} else if new is Array {
    print("Is Array")
}

for item in new {
    print(item)
}
*/
