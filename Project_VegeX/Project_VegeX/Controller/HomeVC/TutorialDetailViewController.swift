//
//  TutorialDetailViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/16/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class TutorialDetailViewController: UIViewController {
    
    
    // MARK: - Properties
    let dataBrain = DataBrain()
    
    let backgroundImage = UIImage(named: "VegetableBackground")
    let backgourndFilter = UIView()
    let backgroundImageView = UIImageView()
    
    lazy var backButton = UIBarButtonItem(image: UIImage(named: "left-allow"), style: .plain, target: self, action: #selector(handleBackButton(_:)))
    
    let categoryLabel = UILabel()
    let titleLabel = UILabel()
    let dayLabel = UILabel()
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    let scrollViewPage = UIView()
    
    let introLabel = UILabel()
    let q1Label = UILabel()
    let a1Label = UILabel()
    let q2Label = UILabel()
    let a2Label = UILabel()
    let q3Label = UILabel()
    let a3Label = UILabel()
    let a3_1Label = UILabel()
    
    let startButton = UIButton(type: .system)
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLazyConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.frame.width, height: containerView.frame.maxY + 20)
        containerView.snp.updateConstraints {
            $0.top.equalToSuperview().offset(-view.safeAreaInsets.top)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    
    // MARK: - UI
    private func configureUI() {
        setNavigationController()
        setPropertyAttributes()
        setConstraints()
        setScrollView()
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .vegeTextBlack
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setPropertyAttributes() {
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgourndFilter.backgroundColor = UIColor(white: 0, alpha: 0.6)
        
        categoryLabel.textColor = .white
        categoryLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 16)
        categoryLabel.text = dataBrain.tutorialDetailVCData[0]["Category"]
        
        titleLabel.textColor = .white
        titleLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 24)
        titleLabel.text = dataBrain.tutorialDetailVCData[0]["Title"]
        
        dayLabel.textColor = .white
        dayLabel.font = VegeXFont.AppleSDGothicNeo_Medium.fontData(fontSize: 16)
        dayLabel.text = dataBrain.tutorialDetailVCData[0]["Day"]
        
        scrollView.backgroundColor = .clear
        containerView.backgroundColor = .clear
        scrollViewPage.backgroundColor = .white
        
        introLabel.attributedText = applyAttributesInTextForAnswers(text: dataBrain.tutorialDetailVCContent[0]["Intro"]!)
        introLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16)
        introLabel.numberOfLines = 0
        
        let questions = [q1Label, q2Label, q3Label]
        generateStringForQuestions(questions: questions)
        
        let answers = [a1Label, a2Label, a3Label, a3_1Label]
        generateStringForAnswers(answers: answers)
        
        startButton.setTitle("1일차 미션 시작", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        startButton.backgroundColor = UIColor(rgb: 0x71A08A)
        startButton.layer.cornerRadius = view.frame.height / 25
        startButton.addTarget(self, action: #selector(handleStartButton(_:)), for: .touchUpInside)
    }
    
    private func setScrollView() {
        scrollView.delegate = self
    }
    
    private func setConstraints() {
        // Add Views
        [backgroundImageView, scrollView].forEach {
            view.addSubview($0)
        }
        [backgourndFilter, categoryLabel, titleLabel, dayLabel].forEach {
            backgroundImageView.addSubview($0)
        }
        
        [containerView].forEach {
            scrollView.addSubview($0)
        }
        
        [scrollViewPage].forEach {
            containerView.addSubview($0)
        }
        
        [introLabel, q1Label, a1Label, q2Label, a2Label, q3Label, a3Label, a3_1Label, startButton].forEach {
            scrollViewPage.addSubview($0)
        }
        
        // Set Layout
        backgroundImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY)
        }
        backgourndFilter.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().offset(-100)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(categoryLabel)
            $0.top.equalTo(categoryLabel.snp.bottom).offset(5)
        }
        
        dayLabel.snp.makeConstraints {
            $0.leading.equalTo(categoryLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(35)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.width.equalTo(scrollView)
            $0.height.equalTo(1800)
        }
        
        introLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(37)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(scrollView).inset(20)
        }
        
        let labels = [q1Label, a1Label, q2Label, a2Label, q3Label, a3Label, a3_1Label]
        
        for index in labels.indices {
            if index == 0 {
                labels[index].snp.makeConstraints {
                    $0.top.equalTo(introLabel.snp.bottom).offset(30)
                    $0.centerX.equalToSuperview()
                    $0.width.equalTo(scrollView).inset(20)
                }
            } else {
                labels[index].snp.makeConstraints {
                    $0.top.equalTo(labels[index - 1].snp.bottom).offset(30)
                    $0.centerX.equalToSuperview()
                    $0.width.equalTo(scrollView).inset(20)
                }
            }
        }
        
        startButton.snp.makeConstraints {
            $0.top.equalTo(labels.last!.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(scrollView).inset(50)
            $0.height.equalTo(view.frame.height / 12)
        }
    }
    
    private func setLazyConstraints() {
        let imageHeight = backgroundImageView.frame.height
        
        scrollViewPage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(imageHeight)
            $0.width.equalToSuperview()
            $0.height.equalTo(1800)
        }
    }
    
    
    // MARK: - Helpers
    private func generateStringForQuestions(questions: [UILabel]) {
        for index in questions.indices {
            questions[index].text = dataBrain.tutorialDetailVCContent[0]["Q" + "\(index + 1)"]!
            questions[index].font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 20)
            questions[index].numberOfLines = 0
        }
    }
    
    private func generateStringForAnswers(answers: [UILabel]) {
        for index in answers.indices {
            if answers[index] == a3_1Label {
                answers[index].attributedText = applyAttributesInTextForAnswers(text: dataBrain.tutorialDetailVCContent[0]["A" + "\(index)" + "_1"]!)
                answers[index].font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16)
                answers[index].numberOfLines = 0
                return
            } else {
                answers[index].attributedText = applyAttributesInTextForAnswers(text: dataBrain.tutorialDetailVCContent[0]["A" + "\(index + 1)"]!)
                answers[index].font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16)
                answers[index].numberOfLines = 0
            }
        }
    }
    
    private func applyAttributesInTextForAnswers(text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        let _ = [ NSAttributedString.Key.font: VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16) ]
        return attributedString
    }
    
    
    // MARK: - Selectors
    @objc private func handleBackButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleStartButton(_ sender: UIButton) {
        let controller = TutorialMissionViewController()
        controller.delegate = self
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }
}

extension TutorialDetailViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}

extension TutorialDetailViewController: TutorialMissionViewControllerDelegate {
    func handlePopController() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
