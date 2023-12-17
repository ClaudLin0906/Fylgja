//
//  FlexibleSteppedProgressBarView.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/16.
//

import UIKit
import fluid_slider

class FlexibleSteppedProgressBarView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var slider:Slider!

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func formatterToString(_ fraction:CGFloat) -> String {
        let formatter = NumberFormatter()
        formatter.maximumIntegerDigits = 1
        formatter.maximumFractionDigits = 1
        return formatter.string(from: (fraction * 5) as NSNumber) ?? ""
    }
    
    private func customInit(){
        loadNibContent()
        slider.attributedTextForFraction = { [weak self] fraction in
            let string = self?.formatterToString(fraction)
            return NSAttributedString(string: string ?? "0")
        }
        slider.setMinimumLabelAttributedText(NSAttributedString(string: "0"))
        slider.setMaximumLabelAttributedText(NSAttributedString(string: "5"))
        slider.fraction = 0
        slider.didBeginTracking = { [weak self] _ in
            
        }
        slider.didEndTracking = { sli in
            print("end value \(self.formatterToString(sli.fraction))")
        }
        slider.contentViewColor = commonColor
        slider.valueViewColor = .white
    }

}
