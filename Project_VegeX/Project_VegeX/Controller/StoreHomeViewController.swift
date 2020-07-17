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
    let categoryCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    
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
        
        categoryCollectionView.register(StoreCategoryCell.self, forCellWithReuseIdentifier: StoreCategoryCell.identifier)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    private func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        [searchBar, cartImageView, storeMenuBar].forEach {
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
    }
    
    
    // MARK: - Selectors
    @objc private func handleBarButton(_ sender: UIBarButtonItem) {
        print(#function)
    }
    
}

extension StoreHomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: StoreCategoryCell.identifier, for: indexPath) as? StoreCategoryCell else { fatalError() }
        cell.backgroundColor = .red
        return cell
    }
    
}

extension StoreHomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
