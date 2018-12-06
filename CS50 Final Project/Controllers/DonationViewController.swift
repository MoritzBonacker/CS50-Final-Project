//  View Controller for Donations
//  DonationViewController.swift
//  CS50 Final Project
//
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

import UIKit
import Firebase

class DonationViewController: UIViewController {
    
    @IBOutlet weak var SelectedCharity: UILabel!
    @IBOutlet weak var DollarButton1: UIButton!
    @IBOutlet weak var DollarButton2: UIButton!
    @IBOutlet weak var DollarButton3: UIButton!
    
    // Vari
    var Charity_selected = String()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Stylizes donation buttons
        DollarButton1.roundButton()
        DollarButton2.roundButton()
        DollarButton3.roundButton()
        
        SelectedCharity.text = Charity_selected
    }
    
    @IBAction func OneTapped(_ sender: UIButton) {
        InsertDatabase(amount: 1)
    }
    
    @IBAction func FiveTapped(_ sender: UIButton) {
        InsertDatabase(amount: 5)
    }
    

    @IBAction func TenTapped(_ sender: UIButton) {
        InsertDatabase(amount: 10)
    }
    
    func InsertDatabase (amount: Int) {
        let user = Auth.auth().currentUser
        if user == nil {
            return()
        }
        else {
            let ref = Database.database().reference()
            let data = ["Name": Charity_selected, "Amount": amount, "Timestamp": ServerValue.timestamp() ] as [String : Any]
            ref.child("user").child(user!.uid).childByAutoId().setValue(data)
        }
    }
}

// Function to stylized button
// Source: https://www.youtube.com/watch?v=xpTGEoUMiOE
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

