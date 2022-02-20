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
    }
    
    func calculateBMI() {
        
        

    }
    
    func addTargetToTextField(){
        // call func textFieldChanged everytime when editing in textfield changes (when user types or changes something)
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        sizeTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        weightTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        
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








































