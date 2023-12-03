//
//  WaitingTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/3.
//

import UIKit

class WaitingTableViewCell: UITableViewCell {
    
    static let identifier = "WaitingTableViewCell"
    
    @IBOutlet weak var background:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.borderColor = UIColor(named: "CommonColor")?.cgColor
        background.layer.borderWidth = 1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
