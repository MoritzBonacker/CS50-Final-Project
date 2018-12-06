/* RegisterViewController.swift
CS50 Final Project
 
Implements register functionality. User can register in which case a new user is created in Firebase. Checks for invalid user input and username availability and displays a user alter if invalid input was added.

Copyright © 2018 CS50 Project Team. All rights reserved. */

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        // Stylizes the register button
        RegisterButton.roundButton()
    }
    
    // Declares IBOutlets to reference particular elements in the View
    @IBOutlet weak var RegisterEmail: UITextField!
    @IBOutlet weak var RegisterPassword: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    @IBOutlet weak var RegisterConfirmation: UITextField!
    
    // Creates new user, if user tapped RegisterButton
    @IBAction func tappedRegistered(_ sender: UIButton) {
        
        // Checks if passwords match and creates alert if not
        if RegisterPassword.text! != RegisterConfirmation.text! {
            self.createAlert(title: "Error", message: "Passwords do not match")
            return
        }
        
        // Tries to create a new user with provided information
        Auth.auth().createUser(withEmail: RegisterEmail.text!, password: RegisterPassword.text!)  { user, error in
            
            // If user was successfully created, user is redirected to menu
            if error == nil && user != nil {
                self.performSegue(withIdentifier: "registerToMenu", sender: self)
            }
            
            // Otherwise, user alert is created and user can't proceed to next page
            else {
                print("ERROR")
                self.createAlert(title: "Error", message: (error?.localizedDescription)!)
            }
        }
    }
    
    // Creates a user alert with individualized message, source: https://www.youtube.com/watch?v=4EAGIiu7SFU&t=357s
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

}
