//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Sung Jae Min on 7/4/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import Foundation

func multiply(op1: Double, op2: Double) -> Double{
    return op1 * op2
}

class CalculatorBrain
{
    private var accumulator = 0.0
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    var operations: Dictionary<String,Operation> = [
        "π": Operation.Constant(Double.pi), // Double.pi
        "√": Operation.UnaryOperation(sqrt), //sqrt
        "cos": Operation.UnaryOperation(cos), //cos
        "x" : Operation.BinaryOperation(multiply),
        "=" : Operation.Equals
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation{
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                if pending != nil {
                    accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
                    pending = nil
                }
            }
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo{
        var binaryFunction: (Double,Double) -> Double
        var firstOperand: Double
    }

        //let constant = operations[symbol]
        //accumulator = constant!
        /*
        switch symbol {
        case "enter": return
        //case "delete" : = String(accumulator).characters.dropLast()
        case "π": accumulator = Double.pi
        case "√": accumulator = sqrt(accumulator)
        default : break
        }
         */
    
    
    // Read only property
    var result: Double{
        get{
            return accumulator
        }
    }
}
