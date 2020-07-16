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
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        return label
    }()
    
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .vegeTextBlack
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 16)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .vegeTextBlack
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
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
        backgroundColor = .systemBackground
        setConstraints()
    }
    
    private func setConstraints() {
        [imageView, missionTypeLabel, mainTitleLabel, dateLabel].forEach {
            addSubview($0)
        }
        
        imageView.backgroundColor = .red
        missionTypeLabel.text = "주간"
        mainTitleLabel.text = "자전거 출퇴근"
        dateLabel.text = "2020.07.13 - 07.29"
        
        imageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(239)
        }
        
        missionTypeLabel.snp.makeConstraints {
            $0.top.equalTo(imageView).inset(10)
            $0.trailing.equalToSuperview().inset(198.5)
            $0.bottom.equalToSuperview().inset(101)
        }
        
        mainTitleLabel.snp.makeConstraints {
            $0.top.equalTo(missionTypeLabel.snp.bottom)
            $0.leading.equalTo(missionTypeLabel)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(missionTypeLabel)
            $0.bottom.equalTo(imageView).inset(15)
        }
    }
    
    
    // MARK: - Helpers
    func configureData(image: String, title: String, missionType: String, date: String) {
        imageView.image = UIImage(named: image)
        missionTypeLabel.text = missionType
        mainTitleLabel.text = title
        dateLabel.text = date
    }
}
