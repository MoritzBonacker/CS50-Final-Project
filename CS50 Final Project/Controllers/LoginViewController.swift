//
//  ViewController.swift
//  CS50 Final Project
//
//  Created by Moritz Bonacker on 13.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var LoginEmail: UITextField!
    @IBOutlet weak var LoginPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
 
    
    override func viewDidAppear(_ animated: Bool){
    }
    
    let loginToMenu = "loginToMenu"
    
    // Login functionality
    @IBAction func tappedLogin(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: LoginEmail.text!, password: LoginPassword.text!) { user, error in
            if error == nil {
                print("There was an error")
                self.performSegue(withIdentifier: "loginToMenu", sender: self)
            }
        }
    }
    
    // Register functionality
    @IBAction func tappedRegister(_ sender: UIButton) {
        self.performSegue(withIdentifier: "loginToRegister", sender: self);
        }
    
    @IBOutlet weak var RegisterEmail: UITextField!
    @IBOutlet weak var RegisterPassword: UITextField!
    @IBOutlet weak var RegisterConfirmation: UITextField!
    
    @IBAction func tappedRegistered(_ sender: UIButton) {
        
        if RegisterPassword.text! != RegisterConfirmation.text! {
            return
        }
        Auth.auth().createUser(withEmail: RegisterEmail.text!, password: RegisterPassword.text!) /* { user, error in
            if error == nil && user != nil {
                print("User created!")
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
 */
        // Auth.auth().signIn(withEmail: RegisterEmail.text!, password: RegisterPassword.text!)
       // self.performSegue(withIdentifier: "registerToMenu", sender: self);
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
}
