//
//  ChallengeCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

protocol ChallengeCustomCellDelegate: class {
    func handleRegister(_ cell: ChallengeCustomCell)
}

class ChallengeCustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "ChallengeCustomCell"
    
    weak var delegate: ChallengeCustomCellDelegate?
    
    private let chaImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemPurple
        iv.snp.makeConstraints {
            $0.width.height.equalTo(120)
        }
        iv.image = UIImage(named: "exampleContents")
        return iv
    }()
    
    private let cafegoryLabel: UILabel = {
        let label = UILabel()
        label.text = "주간"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        return label
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.text = "주 3회 채식 도시락 싸가기"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020.07.13 - 07.29"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        return label
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.snp.makeConstraints {
            $0.width.equalTo(66)
            $0.height.equalTo(24)
        }
        button.setImage(UIImage(named: "registerPicture"), for: .normal)
        button.tintColor = UIColor(rgb: 0x71A08A)
        button.addTarget(self, action: #selector(handleRegister(_:)), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleRegister(_ sender: UIButton) {
        delegate?.handleRegister(self)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        addSubview(chaImageView)
        chaImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        
        let stack = UIStackView(arrangedSubviews: [cafegoryLabel, contentsLabel])
        stack.spacing = 8
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.leading.equalTo(chaImageView.snp.trailing).offset(12)
            $0.top.equalToSuperview().offset(16)
        }
        
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(chaImageView.snp.trailing).offset(12)
            $0.bottom.equalToSuperview().offset(-12)
        }
        
        addSubview(registerButton)
        registerButton.snp.makeConstraints {
            $0.centerY.equalTo(dateLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-8)
        }
    }
    
}
