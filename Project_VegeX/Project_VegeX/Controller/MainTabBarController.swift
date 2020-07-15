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
            title: "홈",
            image: UIImage(named: "home"),
            selectedImage: nil)
        
        
        let magazineController = MagazineViewController()
        magazineController.tabBarItem = UITabBarItem(
            title: "매거진",
            image: UIImage(named: "magazine"),
            selectedImage: nil)
        
        let storeController = StoreViewController()
        storeController.tabBarItem = UITabBarItem(
            title: "스토어",
            image: UIImage(named: "store"),
            selectedImage: nil)
        
        let communityController = CommunityViewController()
        communityController.tabBarItem = UITabBarItem(
            title: "커뮤니티",
            image: UIImage(named: "community"),
            selectedImage: nil)
        
        let myPageController = MyPageViewController()
        myPageController.tabBarItem = UITabBarItem(
            title: "마이페이지",
            image: UIImage(named: "mypage"),
            selectedImage: nil)
        
        viewControllers = [naviHome, magazineController, storeController, communityController, myPageController]
        viewControllers?.forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(rgb: 0x71A08A)
            self.tabBar.tintColor = UIColor(rgb: 0x71A08A)
            tabBar.standardAppearance = appearance
        }
    }
    
}

