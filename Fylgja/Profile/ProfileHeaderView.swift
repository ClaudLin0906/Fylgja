//
//  ProfileHeaderView.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/30.
//

import UIKit

class ProfileHeaderView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var nameLabel:UILabel!
    
    @IBOutlet weak var pictureImageView:UIImageView!

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
