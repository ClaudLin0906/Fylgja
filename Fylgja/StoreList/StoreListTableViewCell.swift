//
//  StoreListTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/8.
//

import UIKit

class StoreListTableViewCell: UITableViewCell {
    
    static let identifier = "StoreListTableViewCell"
    
    @IBOutlet weak var distanceBackground:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        distanceBackground.layer.borderColor = UIColor(named: "CommonColor")?.cgColor
        distanceBackground.layer.borderWidth = 1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}