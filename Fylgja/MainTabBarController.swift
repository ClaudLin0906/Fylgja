//
//  MainTabBarController.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    let tabbarTitle:[String] =
    [
        "候位"
    ]
    
    let noSelectImages:[UIImage?] =
    [
        UIImage(systemName: "house.fill")
    ]
    
    let selectImages:[UIImage?] =
    [
        UIImage(systemName: "house.fill")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        updateTabBarAppearance()
    }

    private func updateTabBarAppearance(){
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "CommonColor") ?? .black]
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "CommonColor") ?? .black]
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.configureWithOpaqueBackground()
        if #available(iOS 15.0, *) {
//            tabBarAppearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 15)
//            tabBarAppearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 15)
            tabBar.scrollEdgeAppearance = tabBarAppearance
        }
        tabBar.standardAppearance = tabBarAppearance
    }
    

    private func setupItems() {
        for (index,value) in tabbarTitle.enumerated(){
            let noSelectImageSize = CGSize(width: 30, height: 30)
            let SelectImageSize = CGSize(width: 30, height: 30)
            let noSelectImage = noSelectImages[index]!.resize(targetSize: noSelectImageSize).withRenderingMode(.alwaysOriginal)
            let SelectImage = selectImages[index]!.resize(targetSize: SelectImageSize).withRenderingMode(.alwaysOriginal)
            if let nc = viewControllers![index] as? UINavigationController {
                nc.tabBarItem.title = value
                nc.tabBarItem.image = noSelectImage.withTintColor(UIColor(named: "CommonColor") ?? .black, renderingMode: .alwaysOriginal)
                nc.tabBarItem.selectedImage = SelectImage.withTintColor(UIColor(named: "CommonColor") ?? .black, renderingMode: .alwaysOriginal)
                nc.tabBarController?.tabBar.backgroundColor = .brown
            }
        }
    }


}
