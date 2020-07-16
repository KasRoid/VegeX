//
//  TutorialDetailViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/16/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class TutorialDetailViewController: UIViewController {
    
    
    // MARK: - Properties
    let dataBrain = DataBrain()
    
    let backgroundImage = UIImage(named: "VegetableBackground")
    let backgourndFilter = UIView()
    let backgroundImageView = UIImageView()
    
    lazy var backButton = UIBarButtonItem(image: UIImage(named: "NewBackButton"), style: .plain, target: self, action: #selector(handleBackButton(_:)))
    
    let categoryLabel = UILabel()
    let titleLabel = UILabel()
    let dayLabel = UILabel()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        setNavigationController()
        setPropertyAttributes()
        setConstraints()
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .vegeTextBlack
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setPropertyAttributes() {
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgourndFilter.backgroundColor = UIColor(white: 0, alpha: 0.6)
        
        categoryLabel.text = dataBrain.tutorialDetailVCData[0]["Category"]
        titleLabel.text = dataBrain.tutorialDetailVCData[0]["Title"]
        dayLabel.text = dataBrain.tutorialDetailVCData[0]["Day"]
        
    }
    
    private func setConstraints() {
        // Add Views
        [backgroundImageView].forEach {
            view.addSubview($0)
        }
        [backgourndFilter, categoryLabel, titleLabel, dayLabel].forEach {
            backgroundImageView.addSubview($0)
        }
        
        // Set Layout
        backgroundImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY)
        }
        backgourndFilter.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.centerY)
            $0.leading.equalToSuperview().inset(20)
        }
        
    }
    
    
    // MARK: - Selectors
    @objc private func handleBackButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
