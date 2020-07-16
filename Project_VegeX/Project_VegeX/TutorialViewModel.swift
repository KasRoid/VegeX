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
        return String.init(format: "%02d", tutorial.day)
    }
    
    var missionText: String {
        return "MISSION. \(tutorial.mission)"
    }
    
    var checkImage: UIImage? {
        return tutorial.isFinish ? UIImage(named: "checkcircle") : UIImage(named: "circle")
    }
}
