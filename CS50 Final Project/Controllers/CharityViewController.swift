/* CharityViewController.swift
 CS50 Final Project
 
 Implements the function to swipe through charities. Information about charities in chosen category is retrieved from firebase and presented to the user. If user swipes, information is changed to next charity's information.
 
 Copyright © 2018 CS50 Project Team. All rights reserved. */


import UIKit
import Firebase

class CharityViewController: UIViewController {
    
    // Declares IBOutlets to reference particular elements in the View
    @IBOutlet weak var CharityPic: UIImageView!
    @IBOutlet weak var CharityName: UILabel!
    @IBOutlet weak var CharitySubcategory: UILabel!
    @IBOutlet weak var DonateButton: UIButton!
    @IBOutlet weak var CharityDescription: UILabel!
    @IBOutlet weak var CharityRating: UIImageView!
    
    // Initializes "counter" to keep track of currently displayed charity and "size" indicating the number of charities in the chosen category
    var counter = 0
    var chosen_category = String()
    var size: Int = 0
    
    // Declares the Dictionary "values" which containes the data retrieved from the database as well as the Array "charities" containing the names of all charities in the chosen category
    var values: Dictionary<String, AnyObject> = [:]
    var charities: Array<String> = []

    override func viewDidLoad() {
        
        // Changes category text to chosen category
        self.CharitySubcategory.text = self.chosen_category
        
        // Implements SwipeGestureRecognizer, source: https://www.youtube.com/watch?v=mA4GZJjUHLo
        CharityPic.isUserInteractionEnabled = true
        
        // Adds SwipeGestureRecognizers to Charity Picture
        let swiftRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swiftRight.direction = UISwipeGestureRecognizer.Direction.right
        CharityPic.addGestureRecognizer(swiftRight)
        
        let swiftLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swiftLeft.direction = UISwipeGestureRecognizer.Direction.left
        CharityPic.addGestureRecognizer(swiftLeft)
        
        // Retrieves data about charities in the chosen category from database
        let ref = Database.database().reference()
        ref.child("Charities").queryOrdered(byChild: "Category").queryEqual(toValue: chosen_category).observe(DataEventType.value, with: { (snapshot) in
            self.values = snapshot.value as! [String : AnyObject]
            self.charities = Array(self.values.keys)
            self.size = self.charities.count
            self.nextCharity()
        })
    }
    
    // Changes properties in CharityView Template to next charity's properties
    func nextCharity () {
        let picture = values[charities[self.counter]]!["Picture"]
        self.CharityName.text = values[charities[self.counter]]!["Name"] as? String
        self.CharityDescription.text = values[charities[self.counter]]!["Description"] as? String
        self.CharityPic.image = UIImage(named: (picture as! String))
        self.CharityRating.image = UIImage(named: ((String(values[charities[self.counter]]!["Rating"] as! Int)) + "stars.png"))
    }
    
    // Changes counter and displays next charity if swipe is recognized
    @objc func swipeGesture(sender: UIGestureRecognizer) {
        if let swipeGesture = sender as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            
            // If user swipes right, previous charity is displayed
            case UISwipeGestureRecognizer.Direction.right:
                if counter > 0 {
                    counter = counter - 1
                    nextCharity()
                }
                // If first charity is currently displayed and user swipes to the right, last charity is displayed
                else {
                    counter = size - 1
                    nextCharity()
                }
            
            // If user swipes left, next charity is displayed
            case UISwipeGestureRecognizer.Direction.left:
                if counter < size - 1 {
                    counter += 1
                    nextCharity()
                }
                // If last charity is currently displayed and user swipes to the left, first charity is displayed
                else {
                    counter = 0
                    nextCharity()
                }
                
            default:
                return
            }
        }
    }
    
    // Creates a link to charity's homepage, source: https://www.youtube.com/watch?v=Epb_ZZBFZIs
    @IBAction func CharityLink(_ sender: Any) {
        UIApplication.shared.open(URL (string:values[charities[self.counter]]!["Link"] as! String)! as URL, options: [:], completionHandler: nil)
    }
    
    // Pushes data (selected data) to DonationViewController, source: https://www.youtube.com/watch?v=7fbTHFH3tl4
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let CharityViewData = segue.destination as! DonationViewController
        CharityViewData.Charity_selected = CharityName.text!
    }
}
