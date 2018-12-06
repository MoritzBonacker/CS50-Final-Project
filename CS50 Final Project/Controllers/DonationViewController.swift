/* DonationViewController.swift
CS50 Final Project
 
Implements donation page. User can select a amount to donate to selected charity. User's donation is saved in database. 
 
 Copyright © 2018 CS50 Project Team. All rights reserved. */

import UIKit
import Firebase

class DonationViewController: UIViewController {
    
    // Declares IBOutlets to reference particular elements in the View
    @IBOutlet weak var SelectedCharity: UILabel!
    @IBOutlet weak var DollarButton1: UIButton!
    @IBOutlet weak var DollarButton2: UIButton!
    @IBOutlet weak var DollarButton3: UIButton!
    
    // Variable containing user' selected charity
    var Charity_selected = String()
    
    override func viewDidLoad() {
        
        // Stylizes donation buttons
        DollarButton1.roundButton()
        DollarButton2.roundButton()
        DollarButton3.roundButton()
        
        // Changes text to name of selected charity
        SelectedCharity.text = Charity_selected
    }
    
    // Stores information that one dollar was donated in database
    @IBAction func OneTapped(_ sender: UIButton) {
        InsertDatabase(amount: 1)
    }
    
    // Stores information that five dollars were donated in database
    @IBAction func FiveTapped(_ sender: UIButton) {
        InsertDatabase(amount: 5)
    }
    
    // Stores information that ten dollars were donated in database
    @IBAction func TenTapped(_ sender: UIButton) {
        InsertDatabase(amount: 10)
    }
    
    // Stores information about charity, amount and time in database
    func InsertDatabase (amount: Int) {
        
        // Checks if user is logged in
        let user = Auth.auth().currentUser
        if user == nil {
            return
        }
        
        // If user is logged in, donation information (name, amount and time) is stored in database
        else {
            let ref = Database.database().reference()
            let data = ["Name": Charity_selected, "Amount": amount, "Timestamp": ServerValue.timestamp() ] as [String : Any]
            ref.child("user").child(user!.uid).childByAutoId().setValue(data)
        }
    }
}

// Stylizes buttons, source: https://www.youtube.com/watch?v=xpTGEoUMiOE
extension UIButton {
    func roundButton() {
        self.backgroundColor = UIColor.black
        // Rounding corners and applying to both corners in relation to height of button
        self.layer.cornerRadius = self.frame.height / 3
        // Stylization of button shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
