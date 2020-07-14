//
//  CustomSegment.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class CustomSegment: UISegmentedControl {
    
    // MARK: - Properties
    
    private let selectedColor = UIColor(rgb: 0x71A08A)
    private var sortedViews = [UIView]()
    private var currentIndex: Int = 0
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cornerRadius = bounds.height/2
        let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = maskedCorners
        layer.masksToBounds = true
    }
    
    // MARK: - Helpers
    
    func configureUI() {
//        backgroundColor = UIColor.black
//        layer.borderColor = UIColor.white.cgColor
////        selectedSegmentTintColor = UIColor.white
//
//        selectedSegmentTintColor = UIColor(rgb: 0x71A08A)
//        layer.borderWidth = 1
//
//        setTitleTextAttributes([
//            NSAttributedString.Key.foregroundColor: UIColor.white,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
//        ], for: .selected)
//        setTitleTextAttributes([
//            NSAttributedString.Key.foregroundColor: UIColor.black,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
//        ], for: .normal)
//
        selectedSegmentIndex = 0
        
        setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)
        ], for: .selected)
        setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
        ], for: .normal)
        
        selectedSegmentTintColor = selectedColor
    }
    
    func changeSelectedIndex(to newIndex: Int) {
//        guard sortedViews.count > 0 else { return }
//        backgroundColor = .white
//        sortedViews[currentIndex].layer.cornerRadius = 40 / 2
//        sortedViews[currentIndex].backgroundColor = UIColor.white
//        currentIndex = newIndex
////        selectedSegmentIndex = UISegmentedControlNoSegment
//        sortedViews[currentIndex].backgroundColor = selectedColor
    }
}
