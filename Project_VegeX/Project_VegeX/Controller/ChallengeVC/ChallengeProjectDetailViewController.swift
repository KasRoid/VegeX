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
    lazy var backButton = UIBarButtonItem(image: UIImage(named: "NewBackButton"), style: .plain, target: self, action: #selector(handleBackButton(_:)))

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let stackView = UIStackView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.frame.width, height: contentView.frame.height)
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .green
        setNavigationController()
        setScrollView()
        setStackView()
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
    
    private func setScrollView() {
        
    }
    
    private func setStackView() {
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
    }
    
    private func setConstraints() {
        [scrollView].forEach {
            view.addSubview($0)
        }
        scrollView.addSubview(contentView)
        
        scrollView.backgroundColor = .white
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.backgroundColor = .green
        contentView.snp.makeConstraints {
            $0.width.equalTo(view.frame.width)
            $0.height.equalTo(view.frame.height * 2)
        }
    }
    
    
    // MARK: - Selectors
    @objc func handleBackButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}
