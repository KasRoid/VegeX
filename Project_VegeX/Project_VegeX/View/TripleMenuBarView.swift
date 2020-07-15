//
//  TripleMenuBarView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/15/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class TripleMenuBarView: UIView {
    
    // MARK: - Properties
    let firstLabelText = "인기"
    let secondLabelText = "기업과 함께하는"
    let thirdLabelText = "최신"
    
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = firstLabelText
        label.textColor = .vegeTextBlack
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = secondLabelText
        label.textColor = .vegeTextBlack
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        return label
    }()
    
    lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.text = thirdLabelText
        label.textColor = .vegeTextBlack
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        return label
    }()
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .vegeGreen
        return view
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
        [firstLabel, secondLabel, thirdLabel, barView].forEach {
            addSubview($0)
        }
        
        setConstraints()
        setGestures()
    }
    
    private func setConstraints() {
        firstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(9)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        barView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leading.equalTo(firstLabel.snp.leading).offset(-8)
            $0.trailing.equalTo(firstLabel.snp.trailing).offset(8)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setGestures() {
        for label in [firstLabel, secondLabel, thirdLabel] {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesuters(_:)))
            gesture.name = label.text
            label.addGestureRecognizer(gesture)
            label.isUserInteractionEnabled = true
        }
    }
    
    
    // MARK: - Selectors
    @objc private func handleGesuters(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: {
            switch sender.name {
            case self.firstLabelText:
                self.barView.snp.removeConstraints()
                self.barView.snp.makeConstraints {
                    $0.height.equalTo(2)
                    $0.leading.equalTo(self.firstLabel.snp.leading).offset(-8)
                    $0.trailing.equalTo(self.firstLabel.snp.trailing).offset(8)
                    $0.bottom.equalToSuperview()
                }
            case self.secondLabelText:
                self.barView.snp.removeConstraints()
                self.barView.snp.makeConstraints {
                    $0.height.equalTo(2)
                    $0.leading.equalTo(self.secondLabel.snp.leading).offset(-8)
                    $0.trailing.equalTo(self.secondLabel.snp.trailing).offset(8)
                    $0.bottom.equalToSuperview()
                }
            case self.thirdLabelText:
                self.barView.snp.removeConstraints()
                self.barView.snp.makeConstraints {
                    $0.height.equalTo(2)
                    $0.leading.equalTo(self.thirdLabel.snp.leading).offset(-8)
                    $0.trailing.equalTo(self.thirdLabel.snp.trailing).offset(8)
                    $0.bottom.equalToSuperview()
                }
            default:
                fatalError("Wrong Gesture")
            }
            self.layoutIfNeeded()
        })
    }
    
}


