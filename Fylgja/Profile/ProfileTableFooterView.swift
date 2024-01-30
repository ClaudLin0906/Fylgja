//
//  ProfileTableFooterView.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/30.
//

import UIKit

class ProfileTableFooterView: UITableViewHeaderFooterView {

    @IBOutlet weak var btn:UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(named: "CommonColor")?.cgColor
    }
}
