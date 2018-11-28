//
//  ViewControllerTableViewCell.swift
//  CategoriesCharity
//
//  Created by Julian Frings on 27.11.18.
//  Copyright © 2018 Julian Frings. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var CharLogo: UIImageView!
    @IBOutlet weak var CharLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
