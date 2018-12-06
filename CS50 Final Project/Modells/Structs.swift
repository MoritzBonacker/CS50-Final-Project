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

class Charity {
    var charity_name: String
    var charity_description: String
    var charity_rating: Int
    var charity_picture: String
    init(name: String, description: String, rating: Int, picture: String) {
        charity_name = name
        charity_description = description
        charity_rating = rating
        charity_picture = picture
    }
}



