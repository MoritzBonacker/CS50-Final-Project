//
//  CharityViewController.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 28.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//Charity UI

/*
import UIKit
import Firebase

class CharityViewController: UIViewController {

    
    
    @IBOutlet weak var CharityPic: UIImageView!
    @IBOutlet weak var CharityName: UILabel!
    @IBOutlet weak var CharitySubcategory: UILabel!
    @IBOutlet weak var DonateButton: UIButton!
    
    
    
    override func viewDidLoad() {
        let ref = Database.database().reference()
        let query = ref.child("Charities").queryOrdered(byChild: "Category").queryEqual(toValue: "Health").observe(DataEventType.value, with: { (snapshot) in
            let values = snapshot.value as? [String:Any]
            print(values)
        })
        /*
        ref.child("Charities/Greenpeace").observeSingleEvent(of: .value) {
            (snapshot) in
            let values = snapshot.value as? [String:Any]
            print(values)
            print(values!["Link"])
        }
        */
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

 */
