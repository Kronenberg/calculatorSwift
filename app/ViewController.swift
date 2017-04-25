import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTyping: Bool = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let displayCurrentText = display.text
            display.text = displayCurrentText! + digit

        } else {
            display.text = digit
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperatopn(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
}
