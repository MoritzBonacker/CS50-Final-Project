// aaa
//  ProfileViewController.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 29.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//////

import UIKit
import Firebase

// https://www.youtube.com/watch?v=VFtsSEYDNRU
class ProfileViewController: UIViewController {
    
    var names_list = [String] ()
    var amounts_list = [Int] ()
    var times_list = [Double] ()
    var values: Dictionary<String, AnyObject> = [:]
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var LogoutButton: UIButton!
    @IBOutlet weak var Username: UILabel!
    
    @IBOutlet weak var lastDonation: UILabel!
    
    
    func LoadHistory() {
        
            let user = Auth.auth().currentUser // https://firebase.google.com/docs/auth/web/manage-users
            if user == nil {
                print("HERE")
                return()
            }
        
            else {
                print("UNDER THIS FUCKER")
                print(user?.uid)
                self.Username.text = user?.email
                
                let ref = Database.database().reference()
                ref.child("user").child(user!.uid).observe(DataEventType.value, with: { (snapshot) in
                    self.values = snapshot.value as? Dictionary<String, AnyObject> ?? [:]
                    // print(self.values)
                    
                    for value in self.values.keys {
                        // print(self.values[value]?["Name"])
                        self.names_list.append(self.values[value]?["Name"] as! String)
                        // print(self.values[value]?["Amount"])
                        self.amounts_list.append(self.values[value]?["Amount"] as! Int)
                        self.times_list.append(self.values[value]?["Timestamp"] as! Double)
                    }
                    let size = self.times_list.count
                    let x = self.times_list[0] / 1000
                    let converted = NSDate(timeIntervalSince1970: x)
                    let formatter = DateFormatter()
                    formatter.timeZone = NSTimeZone.local
                    formatter.dateFormat = "MMM d, h:mm a"
                    let time = formatter.string(from: converted as Date)
                    print(time)
                    self.lastDonation.text = time
                    self.tableView.reloadData()
                })
                
        }
    
    }
    //
    //    let userID = "userID"
    override func viewDidLoad() {
        LogoutButton.roundButton()
        
        tableView.dataSource = self
        LoadHistory()
    // Source: https://www.youtube.com/watch?v=fFpMiSsynXM
    // https://www.youtube.com/watch?v=uBesaTUJZi0
}
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            self.createAlert(title: "Error", message: (logoutError as! String))
        }
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (names_list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath) as! ViewControllerTableViewCellHistory
        
        cell.CharityName.text = names_list[indexPath.row]
        cell.CharityAmount.text = String(amounts_list[indexPath.row]) + " $"
        
        return (cell)
    }
}
