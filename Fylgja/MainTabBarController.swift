//
//  MainTabBarController.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    private let noSelectColor = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)
    
    private let tabbarTitle:[String] =
    [
        "候位",
        "發現",
        "個人"
    ]
    
    private let noSelectImages:[UIImage?] =
    [
        UIImage(named: "hourglass-gray"),
        UIImage(named: "store-gray"),
        UIImage(named: "man-gray")
    ]
    
    private let selectImages:[UIImage?] =
    [
        UIImage(named: "hourglass-active"),
        UIImage(named: "store-active"),
        UIImage(named: "man-active")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        updateTabBarAppearance()
    }

    private func updateTabBarAppearance(){
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: noSelectColor ]
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: commonColor]
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.configureWithOpaqueBackground()
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBarAppearance
        }
        tabBar.standardAppearance = tabBarAppearance
    }
    

    private func setupItems() {
        for (index,value) in tabbarTitle.enumerated(){
            let noSelectImageSize = CGSize(width: 25, height: 25)
            let SelectImageSize = CGSize(width: 25, height: 25)
            let noSelectImage = noSelectImages[index]!.resize(targetSize: noSelectImageSize).withRenderingMode(.alwaysOriginal)
            let SelectImage = selectImages[index]!.resize(targetSize: SelectImageSize).withRenderingMode(.alwaysOriginal)
            if let nc = viewControllers![index] as? UINavigationController {
                nc.tabBarItem.title = value
                nc.tabBarItem.image = noSelectImage.withTintColor(noSelectColor , renderingMode: .alwaysOriginal)
                nc.tabBarItem.selectedImage = SelectImage.withTintColor(commonColor, renderingMode: .alwaysOriginal)
                nc.tabBarController?.tabBar.backgroundColor = .brown
            }
        }
    }


}
