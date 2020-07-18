//
//  ChallengeProjectDetailViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/18/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeProjectDetailViewController: UIViewController {

    // MARK: - Properties
    let scrollView = UIScrollView()
    lazy var backButton = UIBarButtonItem(image: UIImage(named: "NewBackButton"), style: .plain, target: self, action: #selector(handleBackButton(_:)))
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .green
        setNavigationController()
        setConstraints()
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
        [scrollView].forEach {
            view.addSubview($0)
        }
        
        scrollView.backgroundColor = .white
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    // MARK: - Selectors
    @objc func handleBackButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}
