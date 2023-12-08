//
//  WaitStatusView.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/8.
//

import UIKit

class WaitStatusView: UIView, NibOwnerLoadable {
    
    private var status:
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit(){
        loadNibContent()
    }
}
