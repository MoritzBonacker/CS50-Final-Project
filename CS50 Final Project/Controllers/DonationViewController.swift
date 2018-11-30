//
//  DonationViewController.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 29.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
////

import UIKit

class DonationViewController: UIViewController {

    
    
    @IBOutlet weak var SelectedCharity: UILabel!
    @IBOutlet weak var DollarButton1: UIButton!
    @IBOutlet weak var DollarButton2: UIButton!
    @IBOutlet weak var DollarButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        DollarButton1.roundButton()
        DollarButton2.roundButton()
        DollarButton3.roundButton()
    }
}

// Tutorial: https://www.youtube.com/watch?v=xpTGEoUMiOE

extension UIButton {
    func roundButton() {
        self.backgroundColor = UIColor.darkGray
        // Rounding corners and applying to both corners therefore deviding by 2
        self.layer.cornerRadius = self.frame.height / 2
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}


    /*//
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


