//
//  TagsTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/19.
//

import UIKit

class TagsTableViewCell: UITableViewCell {
    
    static let identifier = "TagsTableViewCell"
    
    @IBOutlet weak var tagCollectionView:TagCollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}