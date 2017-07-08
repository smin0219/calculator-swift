//
//  ViewController.swift
//  Calculator
//
//  Created by Sung Jae Min on 7/4/17.
//  Copyright © 2017 Dropquick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var display: UILabel!
    
    var isTyping = false
    
    @IBAction func digitButtons(_ sender: UIButton) {
        
        if(isTyping){
            display.text = (display.text)!+sender.currentTitle!
        }
        else{
            display.text = sender.currentTitle!
        }
        isTyping = true
    }
    
    var displayText: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text! = String(newValue)
        }
    }
    
    private let operation: CalculatorOperation = CalculatorOperation()
    
    @IBAction func performOperations(_ sender: UIButton) {
        
        if isTyping{
            operation.setOperand(operand: displayText)
        }
        isTyping = false
        
        if let mathmaticalSymbol = sender.currentTitle{
            operation.operationHandler(symbol: mathmaticalSymbol)
        }
        
        displayText = operation.getResult
  
        /*
        if let operationSymbol = sender.currentTitle{
            if(operationSymbol == "π"){
                displayText = Double.pi
            }
        }
        */
    }
    
}
