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
    
    // Display numbers
    @IBOutlet private weak var display: UILabel!
    
    // Let it knows whether user is typing or not
    private var isTyping = false
    
    private var prevDisplay = ""
    
    private var displayValue: Double{
        get{
            return Double(display!.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    @IBAction private func touchDigit(_ sender: UIButton)
    {
        let digit = sender.currentTitle!
        
        if isTyping{
            let textCurrentlyInDisplay = display!.text!
            display!.text = textCurrentlyInDisplay + digit
        }
        else{
            display!.text = digit
            isTyping = true
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        
        if isTyping{
            brain.setOperand(operand: displayValue)
            isTyping = false
        }
        else{
            display!.text! = String(String(displayValue).characters.dropLast())
        }
        
        if let operationSymbol = sender.currentTitle{
            brain.performOperation(symbol: operationSymbol)
        }
        displayValue = brain.result
        /*
         isTyping = false
         if operation == "←"{
         let currDisplay = display!.text!
         let newDisplay = currDisplay.substring(to:currDisplay.index(before: currDisplay.endIndex))
         display!.text = newDisplay
         }
         else if operation == "↩︎"{
         display!.text = prevDisplay
         }
         */
    }
}
