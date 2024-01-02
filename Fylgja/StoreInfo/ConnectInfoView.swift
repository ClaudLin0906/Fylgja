//
//  ConnectInfoView.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/2.
//

import UIKit

class ConnectInfoView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var imageView:UIImageView!
    
    @IBOutlet weak var label:UILabel!
    
    enum ConnectType {
        case phoneNumber
        case location
        case addMemeber
    }

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
