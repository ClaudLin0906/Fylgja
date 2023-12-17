//
//  FilterVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/16.
//

import UIKit
import fluid_slider
class FilterVC: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    @IBOutlet weak var progressBarView:FlexibleSteppedProgressBarView!
    
    private var tagCells: [TagCollectionViewCell] = []
    
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
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        collectionView.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: false)
        configCells()
        
    }
    
    func configCells() {
        tagCells = tags.enumerated().map({ (index, tagInfo) -> TagCollectionViewCell in
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: IndexPath(item: index, section: 0)) as! TagCollectionViewCell
            cell.setCell(tagInfo)
            return cell
        })
        
        let optimalCells = collectionView.getOptimalCells(tagCells, maxWidth: UIScreen.main.bounds.width)
        tagCells = optimalCells.reduce(into: [TagCollectionViewCell](), { (cells, resultCells) in
            cells.append(resultCells)
        }) as! [TagCollectionViewCell]
        collectionView.reloadData()
    }

}

extension FilterVC:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tagCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        tagCells[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = tagCells[indexPath.item]
        return cell.intrinsicContentSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}
