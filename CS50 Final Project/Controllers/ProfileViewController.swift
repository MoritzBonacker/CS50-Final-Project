/*  ProfileViewController.swift
CS50 Final Project

Handles the Profile View by reading data about user's transaction history and displaying it in a table view.
The Controller also implements the functionality to log out.
 
Copyright © 2018 CS50 Project Team. All rights reserved. */

import UIKit
import Firebase

// Source: https://www.youtube.com/watch?v=VFtsSEYDNRU
class ProfileViewController: UIViewController {
    
    // Declares Dictionary to hold the data retrieved from Firebase as well as an Array in which information about past transactions will be stored
    var values: Dictionary<String, AnyObject> = [:]
    var transactions = [Transaction] ()
    
    // Declares IBOutlets to reference particular elements in the View
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var LogoutButton: UIButton!
    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var lastDonation: UILabel!
    
    // Retrieves data about user's past transactions from Firebase and stores them into an Array
    func LoadHistory() {
        
        // Identifies current user and only proceeds if user is logged in
        let user = Auth.auth().currentUser // https://firebase.google.com/docs/auth/web/manage-users
        if user == nil {
            return()
        }
        else {
            // Changes displayed username to user's email
            self.Username.text = user?.email
                
            // Retrieves data from Firebase and stores data snapshot in Dictionary, source: https://www.youtube.com/watch?v=Aw5Hb_A_eFI
            let ref = Database.database().reference()
            ref.child("user").child(user!.uid).observe(.childAdded) { (snapshot: DataSnapshot) in
            self.values = (snapshot.value as? Dictionary<String, AnyObject>)!

            // Stores transaction information seperate variables
            let transactionName = self.values["Name"] as! String
            let transactionAmount = self.values["Amount"] as! Int
            let transactionTime = self.values["Timestamp"] as! Double
            
            // Initializes an transaction instance and inserts it at the beginning of the Array. After new information is retrieved, table data is reloaded
            let transaction = Transaction(name: transactionName, amount: transactionAmount , timestamp: transactionTime)
            self.transactions.insert(transaction, at: 0)
            self.tableView.reloadData()
                    
            // Updates time of last transaction, source: https://stackoverflow.com/questions/29243060/trying-to-convert-firebase-timestamp-to-nsdate-in-swift/44261841
            let x = self.transactions[0].time / 1000
            let converted = NSDate(timeIntervalSince1970: x)
            let formatter = DateFormatter()
            formatter.timeZone = NSTimeZone.local
            formatter.dateFormat = "MMM d, h:mm a"
            let time = formatter.string(from: converted as Date)
            self.lastDonation.text = time
                }
        }
    }
    
    // Refreshes table view with data from Firebase, source: https://www.youtube.com/watch?v=VFtsSEYDNRU as well as https://www.youtube.com/watch?v=fFpMiSsynXM and https://www.youtube.com/watch?v=uBesaTUJZi0
    override func viewDidLoad() {
        LogoutButton.roundButton()
        tableView.dataSource = self
        LoadHistory()
}
    
    // Implements log out functionality
    @IBAction func logoutTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            self.createAlert(title: "Error", message: (logoutError as! String))
        }
    }
    
    // Creates a user alert with individualized message
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

// Provides data for table's cells
extension ProfileViewController: UITableViewDataSource {
    
    // Returns number of cells needed
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (transactions.count)
    }
    
    // Changes a cell's content and returns cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath) as! ViewControllerTableViewCellHistory
        cell.CharityName.text = transactions[indexPath.row].charity_name
        cell.CharityAmount.text = String(transactions[indexPath.row].donation_amount) + " $"
        return (cell)
    }
}
