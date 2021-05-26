//
//  CalculatorCommands.swift
//  Calculator
//
//  Created by Jon Hoffman on 12/24/15.
//  Copyright © 2015 Jon Hoffman. All rights reserved.
//

import Foundation

protocol CommandProtocol {
    func execute(firstValue: Double, secondValue:Double) -> Double
}

struct AddCommand: CommandProtocol {
    func execute(firstValue: Double, secondValue: Double) -> Double {
        return firstValue + secondValue
    }
}

struct SubCommand: CommandProtocol {
    func execute(firstValue: Double, secondValue: Double) -> Double {
        return firstValue - secondValue
    }
}

struct MultiplyCommand: CommandProtocol {
    func execute(firstValue: Double, secondValue: Double) -> Double {
        return firstValue * secondValue
    }
}

struct DivideCommand: CommandProtocol {
    func execute(firstValue: Double, secondValue: Double) -> Double {
        return firstValue / secondValue
    }
}

