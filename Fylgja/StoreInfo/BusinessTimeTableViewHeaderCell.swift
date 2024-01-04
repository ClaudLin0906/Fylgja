//
//  BusinessTimeTableViewHeaderCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/4.
//

import UIKit

protocol BusinessTimeTableViewHeaderCellDelegate {
    func pressBtn(_ sender:UIButton)
}

class BusinessTimeTableViewHeaderCell: UITableViewCell {
    
    static let identifier = "BusinessTimeTableViewHeaderCell"
    
    var delegate:BusinessTimeTableViewHeaderCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressBtn(_ sender:UIButton ) {
        delegate?.pressBtn(sender)
    }

}
