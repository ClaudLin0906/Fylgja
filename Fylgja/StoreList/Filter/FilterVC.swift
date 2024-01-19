//
//  FilterVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/16.
//

import UIKit
import fluid_slider
class FilterVC: UIViewController {
        
    @IBOutlet weak var progressBarView:FlexibleSteppedProgressBarView!
    
    @IBOutlet weak var tagCollectionView:TagCollectionView!
    
    private var tags:[Tag] =
    [
        Tag(title: "蔬食", isSelect: false),
        Tag(title: "火鍋", isSelect: true),
        Tag(title: "炸物", isSelect: false),
        Tag(title: "茶飲", isSelect: false),
        Tag(title: "輕食", isSelect: true),
        Tag(title: "甜點", isSelect: true),
        Tag(title: "小吃", isSelect: false),
        Tag(title: "排餐", isSelect: false),
        Tag(title: "異國料理", isSelect: false),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit() {
        tagCollectionView.setTags(tags)
    }
    
}
