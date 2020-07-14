//
//  ViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/7/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: - Helpers
    
    func configureTabBar() {
        let homeViewController = HomeViewController()
        let naviHome = UINavigationController(rootViewController: homeViewController)
        naviHome.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "home"),
            selectedImage: nil)
        
        
        let magazineController = MagazineViewController()
        magazineController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "magazine"),
            selectedImage: nil)
        
        let storeController = StoreViewController()
        storeController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "store"),
            selectedImage: nil)
        
        let communityController = CommunityViewController()
        communityController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "community"),
            selectedImage: nil)
        
        let myPageController = MyPageViewController()
        myPageController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "mypage"),
            selectedImage: nil)
        
        viewControllers = [naviHome, magazineController, storeController, communityController, myPageController]
        viewControllers?.forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(rgb: 0x71A08A)
            tabBar.standardAppearance = appearance
        }
    }
    
}

