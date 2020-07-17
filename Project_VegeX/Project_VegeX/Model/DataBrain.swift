//
//  DataBrain.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/15/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

struct DataBrain {
    
    let challengeTitleVCData: [[String: String]] = [
        ["Image": "Bicycle", "MissionType": "주간", "MainTitle": "자전거 출퇴근", "Date": "2020.07.13 - 07.29"],
        ["Image": "LipCare", "MissionType": "주간", "MainTitle": "비건 립밤 쓰기", "Date": "2020.07.13 - 07.29"],
        ["Image": "Nuts", "MissionType": "주간", "MainTitle": "주5회 견과류 먹기", "Date": "2020.07.13 - 07.29"],
        ["Image": "VegeDiet", "MissionType": "주간", "MainTitle": "주3회 채식 식단 먹기", "Date": "2020.07.13 - 07.29"],
        
        ["Image": "Bicycle", "MissionType": "주간", "MainTitle": "자전거 출퇴근", "Date": "2020.07.13 - 07.29"],
        ["Image": "LipCare", "MissionType": "주간", "MainTitle": "비건 립밤 쓰기", "Date": "2020.07.13 - 07.29"],
        ["Image": "Nuts", "MissionType": "주간", "MainTitle": "주5회 견과류 먹기", "Date": "2020.07.13 - 07.29"],
        ["Image": "VegeDiet", "MissionType": "주간", "MainTitle": "주3회 채식 식단 먹기", "Date": "2020.07.13 - 07.29"],
    ]
    
    let tutorialDetailVCData: [[String: String]] = [
        ["Category": "채식에 대한 오해와 진실", "Title": "채식하면 풀만 먹어야 하나요?", "Day": "DAY 1"],
    ]
}


struct SaveData {
    static let shared = SaveData()
    private init() { }
    
    let tutorialIntroduceText = """
채식에 관심은 있는데 어떻게 시작해야 할지 막막한
초보 그리너들을 위한 7일 튜토리얼입니다. 🥦

하루에 15분, 그리너스에서 제공하는 채식과 관련된 컨텐츠를 읽고
미니 미션들을 완료해보세요. 💪

7일 간의 튜토리얼을 완료하고 나면 책 1권 분량의 지식과 함께
그리너님에게 맞는 채식 스타일을 찾게 됩니다!
"""
    let tutorialList = [
        Tutorial(day: 1, title: "채식에 대한 오해와 진실",
                 mission: "한끼 샐러드 먹기", isFinish: true),
        Tutorial(day: 2, title: "채식의 종류 알아보기",
                 mission: "한끼 샐러드 먹기", isFinish: true),
        Tutorial(day: 3, title: "쉽게 구할 수 있는 대체 식재료",
                 mission: "한끼 샐러드 먹기", isFinish: false),
        Tutorial(day: 4, title: "비건뷰티에 대해서 알아보기",
                 mission: "한끼 샐러드 먹기", isFinish: false),
        Tutorial(day: 5, title: "한구에서 채식을 한다는 것",
                 mission: "한끼 샐러드 먹기", isFinish: false),
        Tutorial(day: 6, title: "채식과 영양소",
                 mission: "한끼 샐러드 먹기", isFinish: false),
        Tutorial(day: 7, title: "비건 상품 고르는 방법",
                 mission: "한끼 샐러드 먹기", isFinish: false)
    ]
}
