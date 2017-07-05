//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Sung Jae Min on 7/4/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private var accumulator = 0.0
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    func performOperation(symbol: String){
        switch symbol {
        case "π": accumulator = Double.pi
        case "√": accumulator = sqrt(accumulator)
        default : break
        }
    }
    
    //func backspaceButton{
        
    //}
    
    // Read only property
    var result: Double{
        get{
            return accumulator
        }
    }
}
