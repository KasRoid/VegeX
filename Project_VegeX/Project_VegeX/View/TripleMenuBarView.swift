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
        label.textColor = .vegeGreen
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
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
    
    let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8305789828, green: 0.8256423473, blue: 0.834374249, alpha: 1)
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
        setConstraints()
        setGestures()
    }
    
    private func setConstraints() {
        [firstLabel, secondLabel, thirdLabel, barView, shadowView].forEach {
             addSubview($0)
         }
         
        firstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(60)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(9)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(60)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        barView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leading.equalTo(self.secondLabel.snp.leading).offset(-8)
            $0.trailing.equalTo(self.secondLabel.snp.trailing).offset(8)
            $0.bottom.equalToSuperview()
        }
        
        shadowView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.bottom.equalToSuperview()
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
    
    
    // MARK: - Helpers
    private func menuSelected(labelText: String) {
        switch labelText {
        case firstLabelText:
            self.firstLabel.textColor = .vegeGreen
            self.firstLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
            [self.secondLabel, self.thirdLabel].forEach {
                $0.textColor = .vegeTextBlack
                $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
            }
        case secondLabelText:
            self.secondLabel.textColor = .vegeGreen
            self.secondLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
            [self.firstLabel, self.thirdLabel].forEach {
                $0.textColor = .vegeTextBlack
                $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
            }
        case thirdLabelText:
            self.thirdLabel.textColor = .vegeGreen
            self.thirdLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
            [self.firstLabel, self.secondLabel].forEach {
                $0.textColor = .vegeTextBlack
                $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
            }
        default:
            fatalError("Not Proper Menu")
        }
    }
    
    
    
    // MARK: - Selectors
    @objc private func handleGesuters(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: {
            self.menuSelected(labelText: sender.name!)
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


