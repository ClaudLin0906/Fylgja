//
//  TagCollectionViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/16.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!
        
    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.titleLabel.intrinsicContentSize.width + 40.0, height: 30)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(_ info:Tag) {
        titleLabel.text = info.title
        if info.isSelect {
            backgroundColor = commonColor
        }
    }

}
