

import UIKit

class ViewController: UIViewController {
    private var isFinishedNumberInput : Bool = true
    private var displayValue : Double {
        get{
            guard let number = Double(displayLabel.text!)else{
                fatalError("This number cannot be displayed as cannot be converted to Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedNumberInput = true

        // implementing +/-, AC and %
        if let calcMethod = sender.currentTitle{
            if calcMethod == "+/-"{
                displayValue *= -1
            }else if calcMethod == "AC" {
                displayValue = 0
            }else if calcMethod == "%" {
                displayValue *= 0.01
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
                // eliminating more than one decimal input
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    // returns the function so that . is not added again
                    if !isInt{
                        return
                    }
                    
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

