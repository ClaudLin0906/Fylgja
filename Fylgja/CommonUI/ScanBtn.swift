//
//  ScanBtn.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/3.
//

import UIKit

class ScanBtn: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var btn:UIButton!
    
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
