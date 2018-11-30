//
//  ViewController.swift
//  CategoriesCharity
//
//  Created by Julian Frings on 27.11.18.
//  Copyright © 2018 Julian Frings. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint1: NSLayoutConstraint!
    
    let categories = ["Health", "Environment", "Education", "Animals", "Poverty"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (categories.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! ViewControllerTableViewCell
        
        cell.CharLogo.image = UIImage(named: (categories[indexPath.row] + ".png"))
        
        cell.CharLabel.text = categories[indexPath.row]
        
        return (cell)
    }
    

    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menuView.layer.shadowOpacity = 1
    }
    

    @IBAction func openMenu(_ sender: Any) {
        
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
    }
    
}
