//
//  ChallengeTitleViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/15.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeTitleViewController: UIViewController {
    
    // MARK: - Properties
    lazy var backButton = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(handleBackButton(_:)))
    
    let menuBar = TripleMenuBarView()
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .vegeGrayBackground
        return collectionView
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .systemBackground
        setNavigationController()
        setConstraints()
        setCollectionView()
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .vegeTextBlack
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        navigationItem.title = "챌린지"
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setConstraints() {
        [menuBar, collectionView].forEach {
            view.addSubview($0)
        }
        
        let safeArea = view.safeAreaLayoutGuide
        menuBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeArea)
            $0.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(menuBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(safeArea)
        }
    }
    
    private func setCollectionView() {
        collectionView.register(ChallengeTitleCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeTitleCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    // MARK: - Helpers
    
    
    // MARK: - Selectors
    @objc private func handleBackButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}


// MARK: - UICollectionViewDataSource
extension ChallengeTitleViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeTitleCollectionViewCell.identifier, for: indexPath) as? ChallengeTitleCollectionViewCell else { fatalError("No Cell Info") }
        cell.backgroundColor = .white
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension ChallengeTitleViewController: UICollectionViewDelegate {
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ChallengeTitleViewController: UICollectionViewDelegateFlowLayout {
    
    struct CollectionViewLayout {
        static let edgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        static let lineSpacing: CGFloat = 10
        static let itemSpacing: CGFloat = 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return CollectionViewLayout.edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        let itemSize = CGSize(width: width, height: height / 5.5)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionViewLayout.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionViewLayout.itemSpacing
    }
    
}
