//
//  StoreViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UITextDragDelegate {
    
    // MARK: - Properties
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "테스트 중인 뷰"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let titleImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "exampleContents"))
        iv.snp.makeConstraints {
            $0.height.width.equalTo(200)
        }
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    private let middleLabel: UILabel = {
        let label = UILabel()
        label.text = "타이틀 제목이 들어감"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textView: UILabel = {
        let tv = UILabel()
//        tv.isScrollEnabled = false
        tv.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 20)
//        tv.addGestureRecognizer(touchGesture)
        tv.isUserInteractionEnabled = true
//        tv.touchesBegan(<#T##touches: Set<UITouch>##Set<UITouch>#>, with: <#T##UIEvent?#>)
//        tv.isExclusiveTouch = true
//        tv.textDragDelegate = self
        tv.backgroundColor = .brown
        tv.text = """
        sdlfkjawlkfjwelf
        sadfklwae
        fas
        f
        xzcv
        awe
        fwe
        f
        dsf
        ewf
        e
        fd
        fd
        f
        wef
        we
        f
        sdf
        sdf
        se
        f
        """

        return tv
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        view.addSubview(topLabel)
        topLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        view.addSubview(titleImageView)
        titleImageView.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(middleLabel)
        middleLabel.snp.makeConstraints {
            $0.top.equalTo(titleImageView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(24)
        }
        
        view.addSubview(textView)
        textView.snp.makeConstraints {
            $0.top.equalTo(middleLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(500)
        }
    }
    
    private var contentsLabelMinY: CGFloat = 0
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contentsLabelMinY = textView.frame.minY
        print(contentsLabelMinY)
    }
    
    // MARK: - Helpers
    
    var previous: CGFloat = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        print("DEBUG: touchesBegan TouchPoint => \(touchPoint)")
//        previous = touchPoint.y
    }
    
    var test: CGFloat = 0
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        let prevPoint = touch.previousLocation(in: touch.view)
//        print("DEBUG: touchesMoved TouchPoint => \(touchPoint)")
        
        let moveHeight = touchPoint.y - prevPoint.y
        print("DEBUG: moveHeight => \(moveHeight)")
        [textView].forEach {
            print($0.frame.origin.y, view.frame.maxY)
            if $0.frame.maxY < view.frame.maxY {
                if moveHeight > 0 {
                    print($0.frame.origin.y, "aa: ", contentsLabelMinY)
                    if $0.frame.origin.y > contentsLabelMinY {
                        print("DSfaewfew")
                    } else {
                        $0.frame.origin.y += moveHeight
                    }
                    
                }
            } else {
                $0.frame.origin.y += moveHeight
                test = titleImageView.frame.width
                titleImageView.snp.updateConstraints {
                    $0.width.height.equalTo(test + moveHeight)
                }
            }
            
            
        }
        view.layoutIfNeeded()
//        previous = touchPoint.y
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return test
//    }
//
//    var test = false
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesEnded(touches, with: event)
      guard let touch = touches.first else { return }
      let touchPoint = touch.location(in: touch.view)
//        UIApplication.shared.status
        setNeedsStatusBarAppearanceUpdate()
      print("DEBUG: touchesEnded TouchPoint => \(touchPoint)")
    }
    
    // 시스템 인터럽션, 터치 주인 뷰가 제거 될때 등
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesCancelled(touches, with: event)
      guard let touch = touches.first else { return }
      let touchPoint = touch.location(in: touch.view)
      print("DEBUG: touchesCancelled TouchPoint => \(touchPoint)")
    }
    
}

