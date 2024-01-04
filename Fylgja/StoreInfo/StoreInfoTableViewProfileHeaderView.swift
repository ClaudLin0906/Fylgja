//
//  StoreInfoTableViewProfileHeaderView.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/4.
//

import UIKit

class StoreInfoTableViewProfileHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var ovalView:UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ovalView.layer.maskedCorners = .top
    }


}
