/*
//  TableViewController.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 27.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

// SEE: https://www.youtube.com/watch?v=XwXEsKRYUXU

import Foundation
import Firebase

class TableViewController: UITableViewController {
    
    var db:Firestore!
    
    var sweetArray = [Charity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    db = Firestore.firestore()
     loadData()
        checkForUpdates()
        
        
    }
}

 */
