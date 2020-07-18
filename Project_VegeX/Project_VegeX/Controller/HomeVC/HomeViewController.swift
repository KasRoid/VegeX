//
//  HomeViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit
import MobileCoreServices

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
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16)
        return label
    }()
    
    private let myPointLabel: UILabel = {
        let label = UILabel()
        label.text = "건강한 습관 15일째"
        label.textColor = UIColor(rgb: 0x156941)
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 20)
        return label
    }()
    
    private lazy var alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "alert"), for: .normal)
        button.tintColor = .black
        button.snp.makeConstraints {
            $0.width.height.equalTo(32)
        }
        button.addTarget(self, action: #selector(handleAlert), for: .touchUpInside)
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
    
    private lazy var tutorialLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 보기"
        label.font = .systemFont(ofSize: 14)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTutorialEvent))
        label.addGestureRecognizer(tapGesture)
        
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var challengeLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 보기"
        label.font = .systemFont(ofSize: 14)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleChallengeEvent))
        label.addGestureRecognizer(tapGesture)
        
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let chaSegment: CustomSegmentControl = {
        let cs = CustomSegmentControl()
        cs.backgroundColor = .white
        cs.layer.cornerRadius = 20
        return cs
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
    
    // MARK: - Selectors
    
    @objc func handleAlert() {
        let controller = ProductDetailViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleMissionEvent() {
        let controller = TutorialMissionViewController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
    @objc func handleTutorialEvent() {
        let controller = TutorialListupViewController()
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleChallengeEvent() {
        let controller = ChallengeTitleViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Helpers
    
    func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        
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
        
        let dailyMissionTitleView = makeHeaderView(titleText: "튜토리얼", detailLabel: tutorialLabel)
        homeScrollView.addSubview(dailyMissionTitleView)
        dailyMissionTitleView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(20)
        }
        
        let dailyMissionView = makeDailyMissionView(
            missionTitle: "1단계",
            missoinSubTitle: "채식에 대한 오해와 진실",
            imageName: "saladIcon")
        homeScrollView.addSubview(dailyMissionView)
        dailyMissionView.snp.makeConstraints {
            $0.top.equalTo(dailyMissionTitleView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(120)
        }
        
        
        let challengeTitleView = makeHeaderView(titleText: "프로젝트",
                                                detailLabel: challengeLabel,
                                                subTitleText: "사람들과 함께 건강해져요")
        homeScrollView.addSubview(challengeTitleView)
        challengeTitleView.snp.makeConstraints {
            $0.top.equalTo(dailyMissionView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(42)
        }
        
        homeScrollView.addSubview(chaSegment)
        chaSegment.snp.makeConstraints {
            $0.top.equalTo(challengeTitleView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(40)
        }
        
        homeScrollView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(chaSegment.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(128 * 5)
        }
    }
    
    func makeHeaderView(titleText: String, detailLabel: UILabel, subTitleText: String? = nil) -> UIView {
        let customView = UIView()
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        titleLabel.textColor = .label
        
        let allowImageView = UIImageView(image: UIImage(named: "right-allow"))
        allowImageView.snp.makeConstraints {
            $0.width.height.equalTo(20)
        }
        
        let viewMoveStack = UIStackView(arrangedSubviews: [detailLabel, allowImageView])
        viewMoveStack.axis = .horizontal
        viewMoveStack.spacing = 0
        viewMoveStack.distribution = .fillProportionally
        
        customView.addSubview(viewMoveStack)
        viewMoveStack.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
        }
        
        guard let subTitleText = subTitleText else {
            customView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints {
                $0.top.leading.bottom.equalToSuperview()
            }
            return customView
        }
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subTitleText
        subTitleLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        subTitleLabel.textColor = .label
        
        let labelStack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        labelStack.axis = .vertical
        labelStack.distribution = .fillProportionally
        labelStack.spacing = 4
        
        customView.addSubview(labelStack)
        labelStack.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        return customView
    }
    
    func makeDailyMissionView(missionTitle: String, missoinSubTitle: String, imageName: String) -> UIView {
        let missionView = UIView()
        missionView.layer.cornerRadius = 10
        missionView.layer.shadowColor = UIColor.lightGray.cgColor
        missionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        missionView.layer.shadowRadius = 5
        missionView.layer.shadowOpacity = 0.5
        missionView.backgroundColor = .white
        
        
        let iconImageView = UIImageView(image: UIImage(named: imageName))
        missionView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints {
            $0.width.height.equalTo(64)
            $0.top.equalToSuperview().offset(28)
            $0.leading.equalToSuperview().offset(32)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = missionTitle
        titleLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 20)
        titleLabel.textColor = .black
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = missoinSubTitle
        subTitleLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 18)
        subTitleLabel.textColor = .black
        
        let titleStack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        titleStack.axis = .vertical
        titleStack.spacing = 4
        titleStack.distribution = .fillProportionally
        
        missionView.addSubview(titleStack)
        titleStack.snp.makeConstraints {
            $0.centerY.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(20)
        }
        
        let statusImageView = UIImageView(image: UIImage(named: "processing"))
        
        missionView.addSubview(statusImageView)
        statusImageView.snp.makeConstraints {
            $0.width.equalTo(45)
            $0.height.equalTo(20)
            $0.top.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMissionEvent))
        missionView.addGestureRecognizer(tapGesture)
        missionView.isUserInteractionEnabled = true
        
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
        cell.delegate = self
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

// MARK: - ChallengeCustomCellDelegate

extension HomeViewController: ChallengeCustomCellDelegate {
    func handleRegister(_ cell: ChallengeCustomCell) {
        let imagePicker = UIImagePickerController()
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeImage] as [String]
        
        if UIImagePickerController.isFlashAvailable(for: .rear) {
            imagePicker.cameraFlashMode = .auto
        }
        
        present(imagePicker, animated: true)
    }
}
