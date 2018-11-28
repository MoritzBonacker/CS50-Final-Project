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
    
    // Login functionality
    @IBAction func tappedLogin(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: LoginEmail.text!, password: LoginPassword.text!)
        performSegue(withIdentifier: "loginToMenu", sender: nil)
    }
    
    // Register functionality
    @IBAction func tappedRegister(_ sender: UIButton) {
        self.performSegue(withIdentifier: "loginToRegister", sender: self);
        }
    
    @IBOutlet weak var RegisterEmail: UITextField!
    @IBOutlet weak var RegisterPassword: UITextField!
    @IBOutlet weak var RegisterConfirmation: UITextField!
    
    @IBAction func tappedRegistered(_ sender: UIButton) {
        /*
        if RegisterPassword.text! != RegisterConfirmation.text! {
            return
        }
 */
        Auth.auth().createUser(withEmail: RegisterEmail.text!, password: RegisterPassword.text!)
        Auth.auth().signIn(withEmail: RegisterEmail.text!, password: RegisterPassword.text!)
        self.performSegue(withIdentifier: "registerToMenu", sender: self);
    }
}
