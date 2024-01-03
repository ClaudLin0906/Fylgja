//
//  BusinessTimeTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/3.
//

import UIKit

class BusinessTimeTableViewCell: UITableViewCell {
    
    static let identifier = "BusinessTimeTableViewCell"
    
    @IBOutlet weak var dayOfWeekLabel:UILabel!
    
    @IBOutlet weak var businessTimeLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
