//
//  TutorialViewModel.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/16.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

struct TutorialViewModel {
    let tutorial: Tutorial
    
    var dayText: String {
        switch tutorial.status {
        case .start: return "DAY \(tutorial.day)"
        case .ongoing: return "미션 완료 시 \(tutorial.point)P"
        case .finish: return "완료"
        }
    }
    
    var dayTextColor: UIColor {
        switch tutorial.status {
        case .start: return .white
        case .ongoing: return UIColor(rgb: 0xF6CC60)
        case .finish: return .white
        }
    }
    
    var titleText: String {
        switch tutorial.status {
        case .start: return tutorial.title
        case .ongoing: fallthrough
        case .finish: return tutorial.mission
        }
    }
    
    var missionText: String {
        return "미션. \(tutorial.mission)"
    }
    
    var buttonText: String {
        switch tutorial.status {
        case .start: return "시작하기"
        case .ongoing: return "인증하기"
        case .finish: return "완료"
        }
    }
    
    var buttonColor: [UIColor] { // [글자색, 배경색]
        switch tutorial.status {
        case .start: return [.white, .clear]
        case .ongoing: return [.vegeTextBlack, .white]
        case .finish: return [.vegeTextBlack, .white]
        }
    }
    
    var checkImage: UIImage? {
        switch tutorial.status {
        case .start: fallthrough
        case .ongoing: return UIImage(named: "circle")
        case .finish: return UIImage(named: "checkcircle")
        }
    }
}
