//
//  ProfileViewController.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 29.11.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
///

import UIKit
import Firebase

// https://www.youtube.com/watch?v=VFtsSEYDNRU
class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var LogoutButton: UIButton!
    
    @IBOutlet weak var Username: UILabel!
    
    var values: Dictionary<String, AnyObject> = [:]
    var transactions: Array<String> = []
    
    //
    //    let userID = "userID"
    override func viewDidLoad() {
        super.viewDidLoad()
        LogoutButton.backgroundColor = UIColor.darkGray
        let user = Auth.auth().currentUser // https://firebase.google.com/docs/auth/web/manage-users
        self.Username.text = user?.email
        
        print(user?.uid)
        let ref = Database.database().reference()
        ref.child("user").child((user?.uid)!).observe(.childAdded, with: { (snapshot) in
            self.values = snapshot.value as! Dictionary<String, AnyObject>
            self.transactions = Array(self.values.keys)
            print(self.values)
        })
        
        var TransactedCharities: Array<String> = []
        
        print(values)
        
        for i in 0...values.count {
            
            TransactedCharities[i] = values[transactions[i]]?["Name"] as! String
        }
        
        print(TransactedCharities)
        
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: userID)
    }
    
    // Source: https://www.youtube.com/watch?v=fFpMiSsynXM
    // https://www.youtube.com/watch?v=uBesaTUJZi0
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (values.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath) as! ViewControllerTableViewCellHistrory
        
        // cell.CharityName = [indexPath.row]
        //cell.DonationAmount = values[transactions[0]]["Amount"]
        
        return (cell)
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
    //
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: userID, for: indexPath)
//
//        cell.textLabel?.text = "BLA"
//        return cell
//    }
    

    

    }

        
        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


