/* LoginViewController.swift
 CS50 Final Project
 
 Implements login functionality. Users' input is checked and if login was successful, access to app data is granted.
 
 Copyright © 2018 CS50 Project Team. All rights reserved. */


import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var LoginEmail: UITextField!
    @IBOutlet weak var LoginPassword: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var RegisterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Stylizes login and register button
        LoginButton.roundButton()
        RegisterButton.roundButton()
    }
    
    // Implements login functionality
    @IBAction func tappedLogin(_ sender: UIButton) {
        
        // Login credentials are passed to the database
        Auth.auth().signIn(withEmail: LoginEmail.text!, password: LoginPassword.text!) { user, error in
            
            // If login was not successful, user alert is created and user can't access the next page
            if error != nil || user == nil {
                self.createAlert(title: "Error", message: (error?.localizedDescription)!)
                return
            }
            else {
                self.performSegue(withIdentifier: "loginToMenu", sender: self)
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
