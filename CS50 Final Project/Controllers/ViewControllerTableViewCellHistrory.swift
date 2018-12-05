//
//  ViewControllerTableViewCellHistrory.swift
//  
//
//  Created by Julian Frings on 04.12.18.
//

import UIKit

class ViewControllerTableViewCellHistrory: UITableViewCell {

    @IBOutlet weak var DonationAmount: UILabel!
    @IBOutlet weak var CharityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
