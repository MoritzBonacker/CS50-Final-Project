//
//  RegisterViewController.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 05.12.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
            return
        }
        Auth.auth().createUser(withEmail: RegisterEmail.text!, password: RegisterPassword.text!)  { user, error in
            if error == nil && user != nil {
                print("User created!")
                self.performSegue(withIdentifier: "registerToMenu", sender: self)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
