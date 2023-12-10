//
//  StoreListTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/8.
//

import UIKit

class StoreListTableViewCell: UITableViewCell {
    
    static let identifier = "StoreListTableViewCell"
    
    @IBOutlet weak var distanceBackground:UIView!{
        didSet{
            distanceBackground.layer.borderColor = commonColor.cgColor
            distanceBackground.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var waitStatusView:WaitStatusView!

    @IBOutlet weak var stackView:UIStackView!
    
    @IBOutlet weak var storeImageView:UIImageView!
    {
        didSet{
            storeImageView.layer.masksToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.removeFullyAllArrangedSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ status:WaitStatus,_ tags:[String]){
        waitStatusView.setStatus(status)
        for title in tags {
            let tagView = TagView()
            tagView.setTag(title, .seclected)
            stackView.addArrangedSubview(tagView)
        }
    }

}
