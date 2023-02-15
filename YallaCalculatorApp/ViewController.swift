//
//  ViewController.swift
//  YallaCalculatorApp
//
//  Created by Yalla,Ravi Chandra on 2/11/23.
//

import UIKit
import MathExpression

class ViewController: UIViewController {

    @IBOutlet weak var mathExpressionLBL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mathExpressionLBL.text = ""
       mathExpressionLBL.numberOfLines = 0
     //   var currentexpression = ""
        
    }
  //  mathExpressionLBL.text = ""
  //   mathExpressionLBL.numberOfLines = 0
     var currentexpression = ""
    

    @IBAction func tappedChar(_ sender: UIButton) {
        
//        guard let character = sender.titleLabel?.text else {
//            return}
//            currentexpression += character
//            mathExpressionLBL.text = currentexpression
        

        
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }
//        guard let expression = self.mathExpressionLBL.text else {
//            return
//        }
        
//        if let char = sender.titleLabel?.text
//        {
//            mathExpressionLBL.text! += char
//        }
//
//        mathExpressionLBL.text! += sender.titleLabel!.text!
//
//        expression += sender.titleLabel!.text!
//        mathExpressionLBL.text = expression
        
        
    
    
//    if buttonText == "="{
//       // let value = self.evaluate(exp: "\(expression + "0")")
//        let value = self.evaluate(exp: expression + "+0")
//        self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
//        return
//    }
        
        if buttonText == "-" || buttonText == "+"{
            let value = self.evaluate(exp: self.mathExpressionLBL.text!)
           // let value = self.eva(exp: expression + "+0")
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            self.mathExpressionLBL.text! += buttonText == "-" ? "-" : "+"
    }
        else{
            if self.mathExpressionLBL.text == "0"{
                self.mathExpressionLBL.text! = buttonText
            }else {
                self.mathExpressionLBL.text! += buttonText
            }
        }
        
//
//        if buttonText == "x" || buttonText == "÷"{
//            let value = self.evaluate(exp: self.mathExpressionLBL.text!)
//           // let value = self.eva(exp: expression + "+0")
//            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
//            self.mathExpressionLBL.text! += buttonText == "x" ? "x" : "÷"
//    }
//        else{
//            if self.mathExpressionLBL.text == "0"{
//                self.mathExpressionLBL.text! = buttonText
//            }else {
//                self.mathExpressionLBL.text! += buttonText
//            }
//        }
        
        
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
      
       // mathExpressionLBL.text = String(result)
//        guard let expression = Double(currentexpression)
//        else{
//            return
//        }
//        let result =  factorial(expression)
//        mathExpressionLBL.text = String(result)
    
   
    
        
        
        
    
    @IBAction func result(_ sender: UIButton) {
//        let expressionEvaluator = NSExpression(format: currentexpression)
//        if let result = expressionEvaluator.expressionValue(with: nil, context: nil) as? Double {
//            mathExpressionLBL.text = "\(result)"
//
//        }
//        else{
//            mathExpressionLBL.text = "Error"
//        }
        
        
    //------
        
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }
        guard let expression = self.mathExpressionLBL.text else {
            return
        }
        if buttonText == "="{
           // let value = self.evaluate(exp: "\(expression + "0")")
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
     //   currentexpression.removeLast()
       // mathExpressionLBL.text = currentexpression
    }
    
    @IBAction func flipSign(_ sender: UIButton) {
        
        guard let expression = Double(currentexpression) else {
            return
        }
        let result = -expression
        mathExpressionLBL.text = String(result)
    }
    
    @IBAction func percent(_ sender: UIButton) {
        
        guard let expression = Double(currentexpression) else
        {
            return
        }
        let result = expression/100
        mathExpressionLBL.text = String(result)
    }
    
    
    
    @IBAction func naturalLog(_ sender: UIButton) {
        guard let expression = Double(currentexpression) else
        {
            return
        }
        let result = expression/100
        mathExpressionLBL.text = String(result)
    }
    
    
    @IBAction func tenpow(_ sender: UIButton) {
        guard let expression = Double(currentexpression)
        else{
            return
        }
        let result = pow(10, expression)
        mathExpressionLBL.text = String(result)
    }
    
    
    @IBAction func calcSin(_ sender: UIButton) {
        guard let expression = Double(currentexpression) else {
            return
        }
        let result = sin(expression)
        mathExpressionLBL.text = String(result)
    }
    
    
    @IBAction func calcCos(_ sender: UIButton) {
        
        guard let expression = Double(currentexpression) else {
            return
        }
        let result = cos(expression)
        mathExpressionLBL.text = String(result)
    }
    
    @IBAction func calcTan(_ sender: UIButton) {
        guard let expression = Double(currentexpression) else {
            return
        }
        let result = tan(expression)
        mathExpressionLBL.text = String(result)
        
    }
    
    
    @IBAction func inverse(_ sender: UIButton) {
        guard let expression = Double(currentexpression) else{
            return
        }
        let result = 1/expression
        mathExpressionLBL.text = String(result)
        
    }
    
    
    }

    


