//
//  ViewController.swift
//  CategoriesCharity
//
//  Created by Julian Frings on 27.11.18.
//  Copyright © 2018 Julian Frings. All rights reserved.
///

import Foundation
import UIKit
import Firebase

var selected_cell = String()

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBAction func toProfileButton(_ sender: Any) { performSegue(withIdentifier: "categoryToProfile", sender: self)
    }
    
    var values: Dictionary<String, AnyObject> = [:]
    var charities: Array<String> = []
    
    //@IBOutlet weak var menuView: UIView!
    //@IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    //@IBOutlet weak var leadingConstraint1: NSLayoutConstraint!
    
    let categories = ["Health", "Environment", "Education", "Animals", "Poverty", "Human Rights", "Public Policy"]
    
    // Source: https://www.youtube.com/watch?v=fFpMiSsynXM
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (categories.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! ViewControllerTableViewCell
        
        cell.CharLogo.image = UIImage(named: (categories[indexPath.row] + ".png"))
        
        cell.CharLabel.text = categories[indexPath.row]

        return (cell)
    
        
    }
    

    // Source: https://www.youtube.com/watch?v=czWu1RXnnUE and https://www.youtube.com/watch?v=pG3n-dFoj0g
    var categoryToSend = String()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        categoryToSend = categories[indexPath.row]
        self.performSegue(withIdentifier: "ToCharityView", sender: nil)
        
        /*
        selected_cell = categories[indexPath.row]
        print(indexPath.row)
        print(selected_cell)
        print("ABOVE HERE IT IS!!!")
        */
        /*
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let CharViewController = Storyboard.instantiateViewController(withIdentifier: "CharityViewController") as! CharityViewController
        
        CharViewController.chosen_category = selected_cell
        self.navigationController?.pushViewController(CharViewController, animated: true)
        */
        
    }


    // Source: https://www.youtube.com/watch?v=czWu1RXnnUE and https://www.youtube.com/watch?v=pG3n-dFoj0g
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let CharityViewData = segue.destination as! CharityViewController
        
        CharityViewData.chosen_category = categoryToSend
        
    }


    
    //var menuShowing = false
    
    override func viewDidLoad() {
        let user = Auth.auth().currentUser
        let ref = Database.database().reference()
        ref.child("user").child(user!.uid).observe(.childAdded, with: { (snapshot) in
            self.values = snapshot.value as! Dictionary<String, AnyObject>
            self.charities = Array(self.values.keys)
            let size = self.charities.count
            print(self.values)
        // Do any additional setup after loading the view, typically from a nib.
        //menuView.layer.shadowOpacity = 1

        // Pushes Data to charity view controller
        // Source: https://www.youtube.com/watch?v=7fbTHFH3tl4
        
        })

    
    
}



    
    /*@IBAction func openMenu(_ sender: Any) {
    
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
    }*/
    

}
