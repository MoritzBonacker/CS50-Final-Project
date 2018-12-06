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
    var values: Dictionary<String, AnyObject> = [:]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var LogoutButton: UIButton!
    @IBOutlet weak var Username: UILabel!
    
    func LoadHistory() {
        
            let user = Auth.auth().currentUser // https://firebase.google.com/docs/auth/web/manage-users
            if user == nil {
                return()
            }
        
            else {
                
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
                    }
                    self.tableView.reloadData()
                })
                
        }
    
    }
    //
    //    let userID = "userID"
    override func viewDidLoad() {
        
        LogoutButton.backgroundColor = UIColor.darkGray
        
        tableView.dataSource = self
        LoadHistory()
    // Source: https://www.youtube.com/watch?v=fFpMiSsynXM
    // https://www.youtube.com/watch?v=uBesaTUJZi0
}



    /*
    @IBAction func logoutTapped(_ sender: UIButton) {
        let signout = try? Auth.auth().signOut()
        if signout == nil {
            print("error")
            else do {
                print("success")

            }
        }
    }*/

}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (names_list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath) as! ViewControllerTableViewCellHistory
        
        cell.CharityName.text = names_list[indexPath.row]
        cell.CharityAmount.text = String(amounts_list[indexPath.row])
        
        return (cell)
    }
}
