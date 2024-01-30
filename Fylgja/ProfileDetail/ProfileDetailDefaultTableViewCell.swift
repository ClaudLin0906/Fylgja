//
//  ProfileDetailDefaultTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/30.
//

import UIKit

class ProfileDetailDefaultTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileDetailDefaultTableViewCell"
    
    @IBOutlet var categoryLabel:UILabel!
    
    @IBOutlet var categoryInfoLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ info:ProfileDetailTableViewInfo) {
        categoryLabel.text = info.category.rawValue
        categoryInfoLabel.text = info.categoryInfo
    }

}
