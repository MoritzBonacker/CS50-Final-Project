//
//  ViewController.swift
//  CS50 Final Project
//
//  Created by Moritz Bonacker on 13.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let loginToContent = "LoginToContent"
    
    @IBOutlet weak var LoginEmail: UITextField!
    @IBOutlet weak var LoginPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool){
        self.performSegue(withIdentifier: "LoginPage", sender: self);
    }
    
    let handle = Auth.auth().addStateDidChangeListener {
        auth, user in
            if user != nil {
    self.performSegue(withIdentifier: self.loginToContent, sender: nil)
        }
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    // Login functionality
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        Auth.auth().signIn(withEmail: textFieldLoginEmail.text!, password: textFieldLoginPassword.text!)
        performSegue(withIdentifier: loginToContent, sender: nil)
    }
    
    // Register functionality
    @IBAction func signUpDidTouch(_ sender: AnyObject) {
    let alert = UIAlertController(title: "Register", message: "Register", preferredStyle: .alert)
    let emailField = alert.textFields![0]
    let passwordField = alert.textFields![1]
    Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!)
        if error != nil {
            print("There is an error") }
        if user != nil {
    Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!)
    self.performSegue(withIdentifier: self.loginToContent, sender: nil)
        }
        }
        
    
    
    // ...
    }
