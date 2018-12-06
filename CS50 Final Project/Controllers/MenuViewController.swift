//
//  MenuViewController.swift
//  CS50 Final Project
//
//  Created by Carla M. Schröder on 29.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
///

import Foundation
import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.layer.shadowOpacity = 1
    }
    
    @IBAction func openMenu(_ sender: Any) {
        
        if (menuShowing){
            leadingConstraint.constant = -120
        }
        else{
            leadingConstraint.constant = 0
    
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                
            })
            
        }
        
        menuShowing = !menuShowing
    }
}
