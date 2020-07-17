//
//  StoreHomeViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/16/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreHomeViewController: UIViewController {
    
    // MARK: - Properties
    let searchBar = CustomSearchBarView()
    let cartImageView = UIImageView()
    let bagImage = UIImage(named: "ShoppingBag")
    
    let storeMenuBar = StoreMenuBarView()
    let storeHomeView = StoreHomeMenuView()
    let storeMainView = StoreMainMenuView()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        setNavigationController()
        setPropertyAttributes()
        setConstraints()
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setPropertyAttributes() {
        cartImageView.image = bagImage
        cartImageView.contentMode = .scaleAspectFit
    }
    
    private func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        [searchBar, cartImageView, storeMenuBar, storeHomeView].forEach {
            view.addSubview($0)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(safeArea).inset(10)
            $0.leading.equalTo(safeArea).inset(20)
            $0.height.equalTo(view.frame.height / 17)
            $0.width.equalTo(view.frame.width / 1.35)
        }
        
        cartImageView.snp.makeConstraints {
            $0.top.bottom.equalTo(searchBar)
            $0.leading.equalTo(searchBar.snp.trailing)
            $0.trailing.equalTo(safeArea)
        }
        
        storeMenuBar.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(safeArea)
        }
        
        storeHomeView.snp.makeConstraints {
            $0.top.equalTo(storeMenuBar.snp.bottom).offset(15)
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(safeArea)
            $0.width.equalToSuperview()
        }
    }
    
    
    // MARK: - Selectors
    @objc private func handleBarButton(_ sender: UIBarButtonItem) {
        print(#function)
    }
    
}
