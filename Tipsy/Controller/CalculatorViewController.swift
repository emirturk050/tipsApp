//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var finalResult:String?
    var percentDisount:String?
    var numberOfPeople: String?
    
   
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
        
        let percent = sender.currentTitle
        let doublePercent = Double((percent?.dropLast())!)
        percentDisount = String(doublePercent!)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.1f", sender.value)
        numberOfPeople = splitNumberLabel.text
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text
        
        if bill != ""{
            let billTotal = Double(bill!)
            let discount = ( billTotal! * Double(percentDisount!)! ) / 100
            let result = ( billTotal! + discount ) /  Double(splitNumberLabel.text!)!
            finalResult = String(result)
            print(result)
            
        }
        performSegue(withIdentifier: "toResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = percentDisount
            destinationVC.split = numberOfPeople
        }
    }
}
