//
//  HomeViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

enum ChallengeType: Int, CaseIterable {
    case processing
    case popular
    
    var description: String {
        switch self {
        case .processing: return "진행중"
        case .popular: return "인기"
        }
    }
}

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let defaultPadding: CGFloat = 20
    
    private let homeScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = UIColor(rgb: 0xF1F2F4)
        return sv
    }()
    
    private let mainIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.snp.makeConstraints {
            $0.width.height.equalTo(52)
        }
        iv.image = UIImage(named: "leaf")
        return iv
    }()
    
    private let myNameLabel: UILabel = {
        let label = UILabel()
        label.text = "천지운 님, 반가워요!"
        label.textColor = UIColor(rgb: 0x156941)
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let myPointLabel: UILabel = {
        let label = UILabel()
        label.text = "1,500point"
        label.textColor = UIColor(rgb: 0x156941)
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "alert"), for: .normal)
        button.tintColor = .black
        button.snp.makeConstraints {
            $0.width.height.equalTo(32)
        }
        return button
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        let myStack = UIStackView(arrangedSubviews: [myNameLabel, myPointLabel])
        myStack.axis = .vertical
        myStack.spacing = -8
        myStack.distribution = .fillProportionally
        
        let amountStack = UIStackView(arrangedSubviews: [mainIconImageView, myStack])
        amountStack.axis = .horizontal
        amountStack.spacing = 8
        amountStack.distribution = .fillProportionally
        
        view.addSubview(amountStack)
        
        amountStack.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(12)
            $0.leading.equalTo(view.snp.leading).offset(defaultPadding)
        }
        
        view.addSubview(alertButton)
        alertButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(6)
            $0.trailing.equalTo(view.snp.trailing).offset(-13)
        }
        return view
    }()
    
    private let challengeButton: UILabel = {
        let label = UILabel()
        label.text = "전체 보기 >"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var challengeSegment: CustomSegment = {
        var items = [String]()
        for index in 0..<ChallengeType.allCases.count {
            let challengeType = ChallengeType(rawValue: index)
            items.append(challengeType!.description)
        }
        
        let sw = CustomSegment(items: items)
        sw.layer.borderColor = UIColor.white.cgColor
        sw.layer.borderWidth = 3.0
        sw.backgroundColor = .white
        return sw
    }()
    
    private let tableView = UITableView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        homeScrollView.contentSize = CGSize(
            width: view.frame.width,
            height: tableView.frame.maxY + 20)
    }
    
    // MARK: - Helpers
    
    func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.isScrollEnabled = false
        
        tableView.register(ChallengeCustomCell.self,
                           forCellReuseIdentifier: ChallengeCustomCell.identifier)
    }
    
    func configureNavi() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureUI() {
        let protectView = UIView()
        protectView.backgroundColor = .white
        view.addSubview(protectView)
        
        protectView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        view.addSubview(homeScrollView)
        homeScrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        homeScrollView.addSubview(topView)
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
            $0.width.equalToSuperview()
        }
        
        let dailyMissionTitleView = makeHeaderView(titleText: "일일미션")
        homeScrollView.addSubview(dailyMissionTitleView)
        dailyMissionTitleView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(21)
        }
        
        let dailyMissionView = makeDailyMissionView(missionTitle: "집에 가는 길에 2정류장 걸어가기", time: "-2시간 30분", point: 20)
        homeScrollView.addSubview(dailyMissionView)
        dailyMissionView.snp.makeConstraints {
            $0.top.equalTo(dailyMissionTitleView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(120)
        }
        
        
        let challengeTitleView = makeHeaderView(titleText: "챌린지",
                                                subTitleText: "건강한 습관을 위한 도전",
                                                detailLabel: challengeButton)
        homeScrollView.addSubview(challengeTitleView)
        challengeTitleView.snp.makeConstraints {
            $0.top.equalTo(dailyMissionView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(42)
        }
        
        homeScrollView.addSubview(challengeSegment)
        challengeSegment.snp.makeConstraints {
            $0.top.equalTo(challengeTitleView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(40)
        }
        
        homeScrollView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(challengeSegment.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(128 * 5)
        }
    }
    
    func makeHeaderView(titleText: String, subTitleText: String? = nil, detailLabel: UILabel? = nil) -> UIView {
        let customView = UIView()
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .label
        
        guard let subTitleText = subTitleText,
            let button = detailLabel else {
                customView.addSubview(titleLabel)
                titleLabel.snp.makeConstraints {
                    $0.top.leading.bottom.equalToSuperview()
                }
                return customView
        }
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subTitleText
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.textColor = .label
        
        let labelStack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        labelStack.axis = .vertical
        labelStack.distribution = .fillProportionally
        labelStack.spacing = 4
        
        customView.addSubview(labelStack)
        labelStack.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        
        customView.addSubview(button)
        button.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
        }
        return customView
    }
    
    func makeDailyMissionView(missionTitle: String, time: String, point: Int) -> UIView {
        let missionView = UIView()
        missionView.layer.cornerRadius = 10
        missionView.layer.shadowColor = UIColor.lightGray.cgColor
        missionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        missionView.layer.shadowRadius = 5
        missionView.layer.shadowOpacity = 0.5
        missionView.backgroundColor = .white
        
        let missionLabel = UILabel()
        missionLabel.text = missionTitle
        missionLabel.font = .systemFont(ofSize: 24)
        missionLabel.numberOfLines = 2
        missionLabel.textColor = .black
        missionLabel.lineBreakMode = .byWordWrapping
        
        let timeImageView = UIImageView(image: UIImage(named: "time"))
        timeImageView.tintColor = UIColor(rgb: 0x303033)
        timeImageView.snp.makeConstraints { $0.width.height.equalTo(12) }
        
        let timeLabel = UILabel()
        timeLabel.text = time
        timeLabel.font = .systemFont(ofSize: 11)
        timeLabel.textColor = UIColor(rgb: 0x303033)
        
        let timeStack = UIStackView(arrangedSubviews: [timeImageView, timeLabel])
        timeStack.axis = .horizontal
        timeStack.spacing = 4
        timeStack.distribution = .fillProportionally
        
        let pointLabel = UILabel()
        pointLabel.text = "\(point)point"
        pointLabel.textColor = UIColor(rgb: 0xFF9D77)
        pointLabel.font = .boldSystemFont(ofSize: 14)
        
        let padding: CGFloat = 16
        
        missionView.addSubview(missionLabel)
        missionLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(padding)
            $0.width.equalTo(164)
        }
        
        missionView.addSubview(timeStack)
        timeStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(padding)
            $0.trailing.equalToSuperview().offset(-padding)
        }
        
        missionView.addSubview(pointLabel)
        pointLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(padding)
            $0.bottom.equalToSuperview().offset(-padding)
        }
        
        return missionView
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChallengeCustomCell.identifier, for: indexPath) as! ChallengeCustomCell
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
}
