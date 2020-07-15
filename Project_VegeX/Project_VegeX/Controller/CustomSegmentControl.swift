//
//  CustomSegmentControl.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class CustomSegmentControl: UIView {
    
    // MARK: - Properties
    
    private var isLeft = true {
        didSet { configureButton() }
    }
    
    private lazy var leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("진행중", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(handleLeftButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("인기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(handleRightButton), for: .touchUpInside)
        return button
    }()
    
    let animationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0x71A08A)
        return view
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        animationView.layer.cornerRadius = animationView.frame.height / 2
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        addSubview(animationView)
        addSubview(leftButton)
        addSubview(rightButton)
        
        animationView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(4)
            $0.bottom.equalToSuperview().offset(-4)
            $0.width.equalTo(leftButton.snp.width)
        }
        
        leftButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(4)
            $0.bottom.equalToSuperview().offset(-4)
        }
        
        rightButton.snp.makeConstraints {
            $0.leading.equalTo(leftButton.snp.trailing)
            $0.top.equalToSuperview().offset(4)
            $0.bottom.trailing.equalToSuperview().offset(-4)
            $0.width.equalTo(leftButton)
        }
    }
    
    func configureButton() {
        if isLeft {
            animationView.snp.removeConstraints()
            UIView.animate(withDuration: 0.3) {
                self.setButtonState(applyColor: .white,
                                    applyFont: .boldSystemFont(ofSize: 14),
                                    button: self.leftButton)
                self.setButtonState(applyColor: .black,
                                    applyFont: .systemFont(ofSize: 14),
                                    button: self.rightButton)
                self.animationView.snp.makeConstraints {
                    $0.top.leading.equalToSuperview().offset(4)
                    $0.bottom.equalToSuperview().offset(-4)
                    $0.width.equalTo(self.leftButton.snp.width)
                }
                self.layoutIfNeeded()
            }
        } else {
            animationView.snp.removeConstraints()
            UIView.animate(withDuration: 0.3) {
                self.setButtonState(applyColor: .white,
                                    applyFont: .boldSystemFont(ofSize: 14),
                                    button: self.rightButton)
                self.setButtonState(applyColor: .black,
                                    applyFont: .systemFont(ofSize: 14),
                                    button: self.leftButton)
                self.animationView.snp.makeConstraints {
                    $0.leading.equalTo(self.leftButton.snp.trailing)
                    $0.top.equalToSuperview().offset(4)
                    $0.bottom.trailing.equalToSuperview().offset(-4)
                    $0.width.equalTo(self.leftButton)
                }
                self.layoutIfNeeded()
            }
        }
    }
    
    func setButtonState(applyColor: UIColor, applyFont: UIFont, button: UIButton) {
        button.setTitleColor(applyColor, for: .normal)
        button.titleLabel?.font = applyFont
    }
    
    // MARK: - Selectors
    
    @objc func handleLeftButton() {
        isLeft = true
    }
    
    @objc func handleRightButton() {
        isLeft = false
    }
}
