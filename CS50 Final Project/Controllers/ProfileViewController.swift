// aaa
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
    
    var names_list = [String] ()
    var amounts_list = [Int] ()
    
    // -> (Array<Any>, Array<Any>)
    func LoadHistory() {
            LogoutButton.backgroundColor = UIColor.darkGray
            let user = Auth.auth().currentUser // https://firebase.google.com/docs/auth/web/manage-users
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
                
                
           // return (names_list, amounts_list)
        }
                print(self.names_list)
        
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: userID)
        })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return (values.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        LoadHistory()
        
        print(names_list)
        print(amounts_list)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath) as! ViewControllerTableViewCellHistory
        
        cell.CharityName.text = names_list[indexPath.row]
        cell.DonationAmount.text = String(amounts_list[indexPath.row])
        
        return (cell)
    }
    

    
    //
    //    let userID = "userID"
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
    

    


        
        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
