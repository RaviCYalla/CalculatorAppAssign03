//
//  ViewController.swift
//  YallaCalculatorApp
//
//  Created by Yalla,Ravi Chandra on 2/11/23.
//

import UIKit
import MathExpression

class CalculatorVC: UIViewController {

    @IBOutlet weak var mathExpressionLBL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
       mathExpressionLBL.numberOfLines = 0
    }

    @IBAction func tappedChar(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }
        
        if buttonText == "-" || buttonText == "+"{
            let value = self.evaluate(exp: self.mathExpressionLBL.text!)
           // let value = self.eva(exp: expression + "+0")
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            self.mathExpressionLBL.text! += buttonText == "-" ? "-" : "+"
        }
        
         else if buttonText == "x" || buttonText == "÷" {
            let expression = self.mathExpressionLBL.text!
            let lastChar = expression.last ?? "0"
            if lastChar.isNumber{
                let value = self.evaluate(exp: expression)
                self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            } else if lastChar == "."{
                self.mathExpressionLBL.text?.removeLast()
            }
             if buttonText == "x"{
             
           self.mathExpressionLBL.text! +=  "*"
        }
             else if buttonText == "÷"{
                 self.mathExpressionLBL.text! += "/"
             }
             }
        
        else{
            if self.mathExpressionLBL.text == "0"{
                self.mathExpressionLBL.text! = buttonText
            }else {
                self.mathExpressionLBL.text! += buttonText
            }
        }
    }
    
    private func evaluate(exp: String) -> Double {
        do{
            let expression = try MathExpression(exp)
            return expression.evaluate()
        }catch{
            print("Invalid expression")
        }
        return 0.0
    }
    
    private func isInteger(value : Double) -> Bool {
        value.truncatingRemainder(dividingBy: 1.0).isZero
    }
        
    @IBAction func factorial(_ sender: UIButton) {
        if let currentText = mathExpressionLBL.text, let currentNumber = Double(currentText){
            let result = factorial(of: currentNumber)
            mathExpressionLBL.text = "\(result)"
        }
    }
    
    func factorial(of number: Double) -> Double{
        if number == 0 {
            return 1
        }
        else{
            return number * factorial(of : number - 1)
        }
    }
          
    @IBAction func result(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }
        guard let expression = self.mathExpressionLBL.text else {
            return
        }
        if buttonText == "="{
            let value = self.evaluate(exp: expression + "+0")
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            return
        }
    }
    
    @IBAction func clearExpression(_ sender: UIButton) {
        mathExpressionLBL.text = ""
    }
    
    @IBAction func backspace(_ sender: UIButton) {
        
        
        if let currenttext = mathExpressionLBL.text{
            mathExpressionLBL.text = String(currenttext.dropLast())
        }
    }
    
    @IBAction func flipSign(_ sender: UIButton) {
        
        guard let expression = Double(mathExpressionLBL.text!) else {
            return
        }
        let result = -expression
        mathExpressionLBL.text = String(result)
    }
    
    @IBAction func percent(_ sender: UIButton) {
        
        guard let expression = Double(mathExpressionLBL.text!) else
        {
            return
        }
        let result = expression/100
        mathExpressionLBL.text = String(result)
    }
    
    @IBAction func naturalLog(_ sender: UIButton) {
        guard let expression = Double(mathExpressionLBL.text!) else
        {
            return
        }
        let result = log(expression)
        mathExpressionLBL.text = String(result)
    }
    
    @IBAction func tenpow(_ sender: UIButton) {
        guard let expression = Double(mathExpressionLBL.text!)
        else{
            return
        }
        let result = pow(10, expression)
        mathExpressionLBL.text = String(result)
    }
    
    @IBAction func calcSin(_ sender: UIButton) {
        
        guard let expression = Double(mathExpressionLBL.text!) else {
            return
        }
        let result = sin(expression)
        mathExpressionLBL.text = String(result)
    }
    
    @IBAction func calcCos(_ sender: UIButton) {
        
        guard let expression = Double(mathExpressionLBL.text!) else {
            return
        }
        let result = cos(expression)
        mathExpressionLBL.text = String(result)
    }
    
    @IBAction func calcTan(_ sender: UIButton) {
        guard let expression = Double(mathExpressionLBL.text!) else {
            return
        }
        let result = tan(expression)
        mathExpressionLBL.text = String(result)
    }
    
    
    @IBAction func inverse(_ sender: UIButton) {
        guard let expression = Double(mathExpressionLBL.text!) else{
            return
        }
        let result = 1/expression
        mathExpressionLBL.text = String(result)
    }
    }
