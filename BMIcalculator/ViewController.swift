//
//  ViewController.swift
//  BMIcalculator
//
//  Created by Soreya Koura on 20.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlet

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var sizeTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    
    @IBOutlet weak var enterButton: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetToTextField()
        
        // disable enter btn and set color to grey on load
        enterButton.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
        enterButton.isEnabled = false
    }
    // MARK: Actions / func
    
    
    @IBAction func clickHereButton_Tapped(_ sender: Any) {
        checkBMI(value: calculateBMI())
    }
    
    func calculateBMI() -> Double {
        
        let height = Double(sizeTextField.text!)!
        let weight = Double(weightTextField.text!)!
        
        let heightSquare = height * height
        let bmi = weight / heightSquare
        
        return bmi
        
    }
    
    func checkBMI(value: Double) {
        var message = ""
        
//        if value <= 20 {
//            message = "Underweight"
//        } else if value >= 20 && value <= 25 {
//            message = "Normal weight"
//        } else if value >= 25 &&  value <= 30 {
//            message = "overweight"
//        } else {
//            message = "strongly overweight"
//        }
        switch value {
        case 0...20: message = "Underweight"
        case 20...25: message = "Normal weight"
        case 25...30: message = "overweight"
        default:
            message = "strongly overweight"
        }
        createAlert(message: message)
    }
       
    
    // MARK: - create alert
    
    func createAlert(message: String) {
        let alert = UIAlertController(title: "\(nameTextField.text!)", message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "OK", style: .default) {(action) in}
        
        alert.addAction(action1)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func addTargetToTextField(){
        // call func textFieldChanged everytime when editing in textfield changes (when user types or changes something)
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        sizeTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        weightTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        // if user is done writing in name text field
        nameTextField.addTarget(self, action: #selector(nameTextFieldChange), for: UIControl.Event.editingDidEnd)
        sizeTextField.addTarget(self, action: #selector(sizeTextFieldChange), for: UIControl.Event.editingDidEnd)
    }
    
    // capitalize first letter in name textfield
   @objc func nameTextFieldChange() {
       let name  = nameTextField.text!
       nameTextField.text = name.capitalizingFirstLetter()
    }
    
    @objc func sizeTextFieldChange() {
        let sizeAsString  = sizeTextField.text!
        let characterset = CharacterSet(charactersIn: ".,")
        //only executed if characters include . & ,
        if sizeAsString.rangeOfCharacter(from: characterset) != nil {
         let sizeAsDouble = Double(sizeAsString)!
         sizeTextField.text = "\(Int(sizeAsDouble * 100.0))"
        } else if !(sizeTextField.text!.isEmpty) {
            let sizeAsCm = Double (sizeTextField.text!)!
            sizeTextField.text = "\(sizeAsCm / 100)"
            
        }
     }
    
    
    
    @objc func textFieldChanged() {
        // check if every textfield has input
        if !(nameTextField.text!.isEmpty) && !(sizeTextField.text!.isEmpty ) && !(weightTextField.text!.isEmpty ){
            // set enter btn color to white and enter btn is clickable
            enterButton.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
            enterButton.isEnabled = true
            
        } else {
            // grey out btn and not clickable
            enterButton.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
            enterButton.isEnabled = false
        }
        
    }
    
    
}


extension String {
    
    // Erster Buchstabe groß, Rest klein
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
 
    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}





































