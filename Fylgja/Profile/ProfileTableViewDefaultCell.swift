//
//  ProfileTableViewDefaultCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/29.
//

import UIKit

class ProfileTableViewDefaultCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewDefaultCell"
    
    @IBOutlet weak var iconImageView:UIImageView!
    
    @IBOutlet weak var titleLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ info:ProfileInfo) {
        titleLabel.text = info.title
        iconImageView.image = info.image
    }

}
