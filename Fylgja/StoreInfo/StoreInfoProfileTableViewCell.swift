//
//  StoreInfoProfileTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/4.
//

import UIKit

class StoreInfoProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var storeNameLabel:UILabel!
    
    @IBOutlet weak var starLabel:UILabel!
    
    @IBOutlet weak var ovalView:UIView!
        
    static let identifier = "StoreInfoProfileTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ovalView.layer.maskedCorners = .top
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        // 设置 cell 的 contentView 宽度等于 UITableView 的宽度
        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: contentView.frame.height)
        contentView.autoresizingMask = .flexibleWidth
    }
}
