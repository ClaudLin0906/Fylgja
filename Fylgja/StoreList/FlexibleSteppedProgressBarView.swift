//
//  FlexibleSteppedProgressBarView.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/16.
//

import UIKit
import FlexibleSteppedProgressBar

class FlexibleSteppedProgressBarView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var flexibleSteppedProgressBar:FlexibleSteppedProgressBar!

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
