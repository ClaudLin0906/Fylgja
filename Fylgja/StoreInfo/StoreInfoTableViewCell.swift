//
//  StoreInfoTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/4.
//

import UIKit

class StoreInfoTableViewCell: UITableViewCell {

    static let identifier = "StoreInfoTableViewCell"
    
    @IBOutlet weak var iconImageView:UIImageView!
    
    @IBOutlet weak var infoLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
