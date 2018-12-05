//
//  CharityViewController.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 28.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//Charity UI


import UIKit
import Firebase

class CharityViewController: UIViewController {

    var selected_cell = String()
    
    @IBOutlet weak var CharityPic: UIImageView!
    @IBOutlet weak var CharityName: UILabel!
    @IBOutlet weak var CharitySubcategory: UILabel!
    @IBOutlet weak var DonateButton: UIButton!
    @IBOutlet weak var CharityDescription: UILabel!
    @IBOutlet weak var CharityRating: UILabel!
    
    // Source: https://www.youtube.com/watch?v=Epb_ZZBFZIs
    @IBAction func CharityLink(_ sender: Any) {
        UIApplication.shared.open(URL (string:values[charities[self.counter]]!["Link"] as! String)! as URL, options: [:], completionHandler: nil)
        
    }
    
    // if let url = NSURL(string: "www.google.com"){
        //    UIApplication.sharedApplication
        //}
    
    
    
    var counter = 0
    var values: Dictionary<String, AnyObject> = [:]
    var charities: Array<String> = []
    var size: Int = 0
    
    var chosen_category = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Source: https://www.youtube.com/watch?v=mA4GZJjUHLo
        CharityPic.isUserInteractionEnabled = true
        
        let swiftRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swiftRight.direction = UISwipeGestureRecognizer.Direction.right
        CharityPic.addGestureRecognizer(swiftRight)
        
        
        let swiftLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swiftLeft.direction = UISwipeGestureRecognizer.Direction.left
        CharityPic.addGestureRecognizer(swiftLeft)

        
        //let chosen_category = "Health"
        let ref = Database.database().reference()
        let query = ref.child("Charities").queryOrdered(byChild: "Category").queryEqual(toValue: chosen_category).observe(DataEventType.value, with: { (snapshot) in
            self.values = snapshot.value as! [String : AnyObject]
            self.charities = Array(self.values.keys)
            self.size = self.charities.count
            self.CharitySubcategory.text = self.chosen_category
            self.nextCharity()
        })

        // Do any additional setup after loading the view.
    }
    
    func nextCharity () {
        let picture = values[charities[self.counter]]!["Picture"]
        self.CharityName.text = values[charities[self.counter]]!["Name"] as! String
        self.CharityDescription.text = values[charities[self.counter]]!["Description"] as! String
        self.CharityPic.image = UIImage(named: (picture as! String))
        //  self.CharityRating.text = values["American Cancer Society"]!["Rating"] as! String
    }
    
    // Pushes Data to second view controller
    // Source: https://www.youtube.com/watch?v=7fbTHFH3tl4
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var CharityViewData = segue.destination as! DonationViewController
        
        CharityViewData.Charity_selected = CharityName.text!

    }
            
    @objc func swipeGesture(sender: UIGestureRecognizer) {
        if let swipeGesture = sender as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swipe right")
                if counter > 0 {
                    counter = counter - 1
                    nextCharity()
                }
                else {
                    return
                }
                
            case UISwipeGestureRecognizer.Direction.left:
                print("Swipe left")
                if counter < size {
                    counter += 1
                    nextCharity()
                }
                else {
                    return
                }
                
            default:
                print("Default")
            }
        }
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


