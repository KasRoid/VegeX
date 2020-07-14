//
//  ViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/7/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    let label = UILabel()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.text = "테스트"
        label.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Helpers
    
    
}

