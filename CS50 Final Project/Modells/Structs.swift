//
//  File.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 26.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

// Hallo hacker

import Foundation
import Firebase


struct Charity {
    // Du bist ein Hacker
    let key: String
    let name: String
    let category: String
    let rating: NSInteger
    let description: String
    // ? makes it optional for property to have a value
    let logo: UIImage?
    //    let ref: DatabaseReference?
    
    // Initializer customizing how structs members are assigned
    init(name: String, category: String, rating: NSInteger, description: String, key: String = "") {
        self.key = key
        self.name = name
        self.category = category
        self.rating = rating
        self.description = description
        self.logo = nil
    }
    
    //    // Import from firebase
    //    init(snapshot: DataSnapshot) {
    //        key = snapshot.key
    //        let snapshotValue = snapshot.value as! [String: AnyObject]
    //        name = snapshotValue["name"] as! String
    //        addedByUser = snapshotValue["addedByUser"] as! String
    //        completed = snapshotValue["completed"] as! Bool
    //        ref = snapshot.ref
    //    }
    
    //    func toAnyObject() -> Any {
    //        return [
    //            "name": name,
    //            "addedByUser": addedByUser,
    //            "completed": completed
    //        ]
    //    }
    //
}


struct Users {
    
    let key: String
    let FirstName: String
    let LastName: String
    let Email: String
    //    let ref: DatabaseReference?
    
    // Initializer customizing how structs members are assigned
    init(FirstName: String, LastName: String, Email: String, key: String = "") {
        self.key = key
        self.FirstName = FirstName
        self.LastName = LastName
        self.Email = Email
    }
}

