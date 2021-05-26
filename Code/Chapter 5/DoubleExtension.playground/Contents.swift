//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension Double {
    func currencyString() -> String {
        let divisor = pow(10.0, 2.0)
        let num =  round(self * divisor) / divisor
        return "$\(num)"
    }
}

var num = 3.45678
print(num.currencyString())
