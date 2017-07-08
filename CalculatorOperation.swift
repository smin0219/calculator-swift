//
//  CalculatorOperation.swift
//  Calculator
//
//  Created by Sung Jae Min on 7/5/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import Foundation

class CalculatorOperation{
    
    var result = 0.0
    
    func setOperand(operand: Double){
        result = operand
    }
    
    var operations: Dictionary<String,Operation> = [
        "π": Operation.Constant(.pi),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "+": Operation.BinaryOperation({$0 + $1}),
        "-": Operation.BinaryOperation({$0 - $1}),
        "*": Operation.BinaryOperation({$0 * $1}),
        "/": Operation.BinaryOperation({$0 / $1}),
        "=": Operation.Equals
    ]
    
    enum Operation{
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double,Double)->Double)
        case Equals
    }
    
    private var pending: binaryOperation?
    
    func operationHandler(symbol: String){
        if let operation = operations[symbol]{
            switch operation{
            case .Constant(let value): result = value
            case .UnaryOperation(let function): result = function(result)
            case .BinaryOperation(let function): pending = binaryOperation(binaryFunction: function, firstOperand: result)
            case .Equals:
                if pending != nil{
                    result = pending!.binaryFunction(pending!.firstOperand,result)
                    pending = nil
                }
            }
        }
    }
    
    struct binaryOperation{
        var binaryFunction: (Double,Double)->Double
        var firstOperand: Double
    }
    
    var getResult: Double{
        get{
            return result
        }
    }
}

