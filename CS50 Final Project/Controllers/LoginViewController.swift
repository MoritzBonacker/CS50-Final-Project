//  Login ViewController
//  ViewController.swift
//  CS50 Final Project
//
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//


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
 
    
    override func viewDidAppear(_ animated: Bool){
    }
    
    let loginToMenu = "loginToMenu"
    
    // Login functionality
    @IBAction func tappedLogin(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: LoginEmail.text!, password: LoginPassword.text!) { user, error in
            if error != nil || user == nil {
                print("There was an error")
                self.createAlert(title: "Error", message: (error?.localizedDescription)!)
                return
            }
            else {
                print("Successfully logged in")
                self.performSegue(withIdentifier: "loginToMenu", sender: self)
            }
        }
    }
    

   /*
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginToMenu" {
            if Auth.auth().currentUser == nil {
                print("No Segue")
                return false
            }
            else {
                print("Segue")
            }
        }
        return true
    } */
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

