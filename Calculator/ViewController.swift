//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var isFinishedNumberInput : Bool = true
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedNumberInput = true
        guard let number = Double(displayLabel.text!)else{
            fatalError("This number cannot be displayed as cannot be converted to Double")
        }
        // implementing +/-
        if let calcMethod = sender.currentTitle{
            if calcMethod == "+/-"{
                displayLabel.text = String(number * -1)
            }else if calcMethod == "AC" {
                displayLabel.text == "0"
            }else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle{
            if isFinishedNumberInput{
            displayLabel.text = numValue
            isFinishedNumberInput = false
            }else{
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

