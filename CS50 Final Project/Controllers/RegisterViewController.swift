//  View Controller for Register
//  RegisterViewController.swift
//  CS50 Final Project
//
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Stylizes the register button
        RegisterButton.roundButton()
        // Do any additional setup after loading the view.
    }
    
    // Register functionality

    
    @IBOutlet weak var RegisterEmail: UITextField!
    
    @IBOutlet weak var RegisterPassword: UITextField!
    
    @IBOutlet weak var RegisterButton: UIButton!
    @IBOutlet weak var RegisterConfirmation: UITextField!
    
    @IBAction func tappedRegistered(_ sender: UIButton) {
        
        if RegisterPassword.text! != RegisterConfirmation.text! {
            self.createAlert(title: "Error", message: "Passwords do not match")
            return
        }
        Auth.auth().createUser(withEmail: RegisterEmail.text!, password: RegisterPassword.text!)  { user, error in
            if error == nil && user != nil {
                print("User created!")
                self.performSegue(withIdentifier: "registerToMenu", sender: self)
            }
            else {
                self.createAlert(title: "Error", message: (error?.localizedDescription)!)
            }
        }
        
        
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

}
