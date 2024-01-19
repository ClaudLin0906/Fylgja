//
//  TagCollectionView.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/19.
//

import UIKit

class TagCollectionView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    private var tags:[Tag] = []
    
    private var tagCells: [TagCollectionViewCell] = []
            
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
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        collectionView.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: false)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setTags(_ tags:[Tag]) {
        self.tags = tags
        configCells()
    }
    
    private func configCells() {
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


extension TagCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
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
