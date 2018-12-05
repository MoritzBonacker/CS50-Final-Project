//
//  ViewControllerTableViewCellHistory.swift
//  CS50 Final Project
//
//  Created by Julian Frings on 05.12.18.
//  Copyright © 2018 CS50 Project Team. All rights reserved.
//

import UIKit

class ViewControllerTableViewCellHistory: UITableViewCell {
    @IBOutlet weak var CharityName: UILabel!
    
    @IBOutlet weak var CharityAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
