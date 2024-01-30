//
//  ProfileTableViewSwtichCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/30.
//

import UIKit

class ProfileTableViewSwtichCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewSwtichCell"
    
    @IBOutlet weak var iconImageView:UIImageView!
    
    @IBOutlet weak var titleLabel:UILabel!
    
    @IBOutlet weak var faceIDSwitch:UISwitch!

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
