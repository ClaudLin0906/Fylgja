//
//  ProfileTableViewLabelCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/30.
//

import UIKit

class ProfileTableViewLabelCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewLabelCell"
    
    @IBOutlet weak var iconImageView:UIImageView!
    
    @IBOutlet weak var titleLabel:UILabel!
    
    @IBOutlet weak var verisonLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        verisonLabel.text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
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
