//
//  BusinessTimeCurrentDayTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/4.
//

import UIKit



class BusinessTimeCurrentDayTableViewCell: UITableViewCell {
    
    static let identifier = "BusinessTimeCurrentDayTableViewCell"
    
    @IBOutlet weak var btnExpandBtn:UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
