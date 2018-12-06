/* ViewControllerTableViewCellHistory.swift
 CS50 Final Project
 
 Supports the implementation of the table displaying users' transaction history.
 
 Copyright © 2018 CS50 Project Team. All rights reserved. */

import UIKit

class ViewControllerTableViewCellHistory: UITableViewCell {
    
    // References columns in history table
    @IBOutlet weak var CharityName: UILabel!
    @IBOutlet weak var CharityAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
