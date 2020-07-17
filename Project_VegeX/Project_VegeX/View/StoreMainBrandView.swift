//
//  StoreMainBrandView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreMainBrandView: UIView {
    
    // MARK: - Properties
    
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    private func configureUI() {
        backgroundColor = .blue
    }
    
    
}
