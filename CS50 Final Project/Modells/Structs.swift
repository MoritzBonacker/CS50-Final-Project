//  File.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 26.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

import Foundation

class Transaction {
    var charity_name: String
    var donation_amount: Int
    var time: Double
    
    init(name: String, amount: Int, timestamp: Double) {
        charity_name = name
        donation_amount = amount
        time = timestamp
    }
}



