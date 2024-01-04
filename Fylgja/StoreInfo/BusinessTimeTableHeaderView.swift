//
//  BusinessTimeTableHeaderView.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/3.
//

import UIKit

protocol BusinessTimeTableHeaderViewDelegate {
    func pressBusinessTime(_ sender:UIButton, _ isExpand: Bool)
}

class BusinessTimeTableHeaderView: UITableViewHeaderFooterView {
    
    var delegate:BusinessTimeTableHeaderViewDelegate?
    
    var isExpand = false // cell 的狀態(展開/縮合)
        
    @IBAction func btnAction( _ sender:UIButton) {
        isExpand = !isExpand
        print(isExpand)
        delegate?.pressBusinessTime(sender, isExpand)
    }
    
}
