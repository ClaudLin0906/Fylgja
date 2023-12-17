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
        let labelSize:CGFloat = 14
        let labelTextAttributesForFraction: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: labelSize, weight: .regular), .foregroundColor: UIColor.black]
        let defaultLabelTextAttributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: labelSize, weight: .regular), .foregroundColor: UIColor.white]

        slider.attributedTextForFraction = { [weak self] fraction in
            let string = self?.formatterToString(fraction)
            return NSAttributedString(string: string ?? "0", attributes: labelTextAttributesForFraction)
        }
        slider.setMinimumLabelAttributedText(NSAttributedString(string: "0", attributes: defaultLabelTextAttributes))
        slider.setMaximumLabelAttributedText(NSAttributedString(string: "5", attributes: defaultLabelTextAttributes))
        slider.fraction = 0
        slider.didBeginTracking = { _ in
            
        }
        slider.didEndTracking = { sli in
            print("end value \(self.formatterToString(sli.fraction))")
        }
        slider.contentViewColor = commonColor
        slider.valueViewColor = .white
    }

}
