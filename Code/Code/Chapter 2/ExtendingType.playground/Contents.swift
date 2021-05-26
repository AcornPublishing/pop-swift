//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


extension Int {
    func factorial() -> Int {
        var answer = 1
        for x in self.stride(to: 1, by: -1) {
            answer *= x
        }
        return answer
    }
}

var f = 10
print(f.factorial())
