//
//  ViewController.swift
//  CS50 Final Project
//
//  Created by Moritz Bonacker on 13.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool){
        self.performSegue(withIdentifier: "LoginPage", sender: self);
    }


}

// Hallo, Julian
