//  View Controller for Categories
//  ViewController.swift
//  CategoriesCharity
//
//  Copyright © 2018 Julian Frings. All rights reserved.
//

import Foundation
import UIKit
import Firebase

// Variable initialized to store whichever sell was selected
var selected_cell = String()

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var values: Dictionary<String, AnyObject> = [:]
    var charities: Array<String> = []

    // Array of categories
    let categories = ["Health", "Environment", "Education", "Animals", "Poverty", "Human Rights", "Public Policy"]
    
    // Initialization fo TableView
    // Source: https://www.youtube.com/watch?v=fFpMiSsynXM
    
    // Makes as many rows in table as there are elements in array categories
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (categories.count)
    }
    
    // Populates cells with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Variable to store data of each cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! ViewControllerTableViewCell
        
        // Populates UIImage in Table view by iterating through catgegories array and concatenating category name with .png string
        // which gives the icon's filename
        // All icons public-domain and royalty free from https://thenounproject.com/
        cell.CharLogo.image = UIImage(named: (categories[indexPath.row] + ".png"))
        
        // Populates Label with category by iterating through category array
        cell.CharLabel.text = categories[indexPath.row]

        return (cell)
    }
    

    // Initializes variable to store the category that was selected and is to be pushed to charity ViewController
    var categoryToSend = String()
    
    // Function that gives the selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Passes the selected category to variable categoryToSend
        categoryToSend = categories[indexPath.row]
        // Performs segue to charity ViewController
        self.performSegue(withIdentifier: "ToCharityView", sender: nil)
    }

    // Pushes data (the selected category) from category ViewController to CharityViewController before segue occurs
    // Source: https://www.youtube.com/watch?v=czWu1RXnnUE and https://www.youtube.com/watch?v=pG3n-dFoj0g
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let CharityViewData = segue.destination as? CharityViewController
        CharityViewData?.chosen_category = categoryToSend
    }
    
    override func viewDidLoad() {
    }
}
    
