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
    
    let tutorialDetailVCContent: [[String: String]] = [
        ["Intro": "회식자리나 여럿이 함께 밥을 먹는 자리에서 ‘채식 하고 있다’라고 하면 주위에서 ‘독한 녀석’ ‘왜 그럼 생선은 먹냐 그건 위선이다’ , ‘어떻게 고기를 안 먹을 수 있느냐’라는 말을 자주 듣습니다. 하지만 저는 저만의 신념을 지니고 있는 평범한 채식주의자이고 이 생활을 5년 동안 지속하고 있습니다. 전 감수성 넘치는 평범한 채식주의자입니다.",
         
         "Q1": "Q. 채식주의로 지내다 보면 영양실조에 걸리지 않나요?",
         "A1": "채식주의에 대한 여러 자료들이 인터넷상에 많이 있는데요. 채식주의에 대한 자료 중에 오로지 야채만을 먹는 '비건'으로 살아가면 섭취할 수 없는 영양분이 있다는 자료들도 가끔 보입니다. 하지만 오늘날에는 단백질을 대체할 수 있는 식품들이 잘 나와 있기 때문에 그런 정보들은 믿을 수 없다고 보시면 됩니다. 현미밥이나 콩, 등을 통해 단백질을 충분히 보충할 수 있습니다. 또한 티모시 블랙웰 책 <생산 관행과 복지>에 따르면 '채식주의 식단은 포화지방과 콜레스테롤을 낮추고 식이섬유, 마그네슘, 포타슘, 비타민 C와 E, 폴산, 카르티노이드, 폴라보노이드, 기타 식물성 화학 물질을 다량으로 함유한다'고 나와 있습니다.",
         
         "Q2": "Q. 눈에 띄는 신체적 변화가 있나요?",
         "A2": "제가 고등학생 때부터 비염이 너무 심했는데 겨울이 되면 이비인후과를 일주일에 세 번씩 가던 사람이었습니다. 하지만 채식을 시작하고부터 비염이 깨끗이 낫고 이제는 병원에도 가지 않습니다. 100% 인과 관계가 있다고 생각하지 않지만, 한의원에 가도 비염환자에게 면역력 향상을 위해 채식을 권유하기도 합니다. 오늘날 고기를 사육하면서 항생제를 많이 사용하게 되는데 이 항생제가 음식에서 사람에게까지 영향을 미친다는 연구결과가 있습니다.",
         
         "Q3": "Q. 마지막으로 전하고 싶은 한마디?",
         "A3": "채식은 환경과 건강을 지키는 일입니다. 환경을 지키는 방법들에는 여러 가지가 있죠. 환경오염 관련 정책 중에는 자동차 홀수제-짝수제, 이산화탄소 배출 줄이기와 같은 것들이 있는 반면에 공장식 축산업에 대한 규제, 음식 관련 정책에 대한 사회적 관심이 적다는 것이 안타까웠습니다.",
         "A3_1": "채식주의자들도 고기를 먹으면 안 된다고 단정짓고 말하는 경우는 거의 없어요. 환경파괴의 요인인 공장식 축산업이 나쁘다고 저항하는 것이지 고기섭취 자체에 반대하는 것은 아닙니다. 여러분들도 주변에 채식주의자가 있다면 그들에게 관심을 가져보세요. 왜 그들이 그런 선택을 하게 되었는지 이해하실 수 있을 겁니다. 이러한 채식주의자들을 아예 다른 사람이라고 생각하지 마시고 자신이 소중하게 생각하는 가치를 위해 노력하는 사람으로 기억해주세요. 모두 그 가치를 지키기 위해 행동하는 방법이 다르듯이 채식주의자도 조금 다를 뿐입니다."
        ]
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
