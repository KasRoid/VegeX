//
//  ChallengeTitleCollectionViewCell.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/15/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeTitleCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "ChallengeTitleCollectionViewCell"
    
    let imageView = UIImageView()
    
    let missionTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .vegeTextBlack
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        return label
    }()
    
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .vegeTextBlack
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .vegeTextBlack
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        return label
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func configureUI() {
        setConstraints()
    }
    
    private func setConstraints() {
        [imageView, missionTypeLabel, mainTitleLabel, dateLabel].forEach {
            addSubview($0)
        }
    }
    
}
