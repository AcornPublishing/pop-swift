//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension String {
    func getFirstChar() -> Character? {
        guard self.characters.count > 0 else {
            return nil
        }
        return self[startIndex]
    }
    
    subscript (r: Range<Int>) -> String
        {
        get {
            return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
        }
    }
}

var myString = "This is a test"
print(myString.getFirstChar())

print(myString[10...12])