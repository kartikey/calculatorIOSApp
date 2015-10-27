//
//  ViewController.swift
//  calculator
//
//  Created by studentuser on 10/22/15.
//  Copyright (c) 2015 studentuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var screen: UITextField!
    var firstNumber: Double? = 0.0
    var secondNumber: Double? = 0.0
    var result: Double? = 0.0
    var isTyping = false
    var operand: String?
    var counter: Int? = 0
    var avg: Double? = 0.0
    var count: Int = 0
    var arr = [Double]()
    
    @IBAction func number(sender: AnyObject) {
        
        if isTyping {
        screen.text = screen.text + sender.currentTitle!!
            
            
        arr[arr.count-1] = (screen.text! as NSString).doubleValue
            
            
        }
        else {
            screen.text = sender.currentTitle
            isTyping = true
            arr.append((screen.text! as NSString).doubleValue)
        }
    }
    
    @IBAction func operation(sender: AnyObject) {
        firstNumber = (screen.text! as NSString).doubleValue
        screen.text = sender.currentTitle
        isTyping = false
        operand = sender.currentTitle
        
    }
    
    @IBAction func equals(sender: AnyObject) {
        if screen.text != "count" || screen.text != "avg" {
            secondNumber = (screen.text! as NSString).doubleValue
        }
        isTyping = false
        
        switch  operand! {
            case "+": result = firstNumber! + secondNumber!
            case "-": result = firstNumber! - secondNumber!
            case "*": result = firstNumber! * secondNumber!
            case "/": result = firstNumber! / secondNumber!
            case "%": result = firstNumber! % secondNumber!
            case "count": result = Double(arr.count)
            case "avg":
                    var sum = 0.0
                for var x = 0; x < arr.count; x++ {
                sum = sum + arr[x]
                
            }
            result = sum/Double(arr.count)
            case "fact":
                if(arr.count > 1) {
                    screen.text = "Error more than 1 number for fact"
                    result = nil
                }
                else {
                    var y = 1
                    for var x = 1; x <= Int(firstNumber!); x++ {
                        y=y*x
                    }
                    result = Double(y)
                }
            
            
            default: screen.text = "ERROR"
        }
        
        
        screen.text = result == nil ? screen.text : "\(result!)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

