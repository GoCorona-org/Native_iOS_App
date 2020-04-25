//
//  CrossCheckViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/11.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class CrossCheckViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let scrollBaseView: UIScrollView = {
        let view = UIScrollView()
        var finalHeight: CGFloat = 0.0
        if let size = bodySize  {
            finalHeight = size.height
        } else {
            finalHeight = 550
        }
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: finalHeight)
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: finalHeight)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        view.backgroundColor = UIColor(rgb: 0xEEEEEE)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let introductionLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 25)
        view.text = "Introduction"
        view.textAlignment = .left
        view.textColor = .black
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let progressView: UIProgressView = {
        let view = UIProgressView()
        view.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
        view.progress = 0.23
        view.progressTintColor = UIColor(rgb: 0x49D581)
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let questionnaireHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "Travel based cross-check check for COVID19"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Medium", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let travelQuestionnaireCheckIcon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        view.image = UIImage(named: "travelquestionnaireicon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let startQuestionnaireButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        view.layer.cornerRadius =  8.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(rgb: 0x49D581).cgColor
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.textAlignment = .center
        view.setTitle("Start the questionnaire", for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Thin", size: 16.0)
        view.backgroundColor = UIColor(rgb: 0xF6F6F6)
        view.addTarget(self, action: #selector(startQuestionnairePressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let intersectionCalculatorHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "Know if you've met a COVID+ve person"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Medium", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let intersectionCalculatorCheckIcon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        view.image = UIImage(named: "intersectioncalculatoricon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let startintersectionCalculatorButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        view.layer.cornerRadius =  8.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(rgb: 0x49D581).cgColor
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.textAlignment = .center
        view.setTitle("Open intersection calculator", for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Thin", size: 16.0)
        view.backgroundColor = UIColor(rgb: 0xF6F6F6)
        view.addTarget(self, action: #selector(startIntersectionCalculationIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let middleSeparator: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 2)
        view.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let endSeparator: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 2)
        view.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70)
        view.backgroundColor = .clear
        let lineView = UIView()
        lineView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 2)
        lineView.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.addSubview(lineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nextButton: UIButton = {
        let view = UIButton()
        view.frame =  CGRect(x: 0, y: 0, width: 100, height: 40)
        view.layer.cornerRadius = 4.0
        view.backgroundColor = UIColor(rgb: 0xE03D51)
        view.titleLabel?.textAlignment = .center
        view.setTitle("Next", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(nextButtonIsTapped(sender:)), for: .touchUpInside)
        return view
    }()
    
    let backButton: UIButton = {
        let view = UIButton()
        view.frame =  CGRect(x: 0, y: 0, width: 100, height: 40)
        view.titleLabel?.textAlignment = .center
        view.setTitle("< Back", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x3B24B1), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(backButtonIsTapped(sender:)), for: .touchUpInside)
        return view
    }()
    
    let bodyBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let options = ["Yes", "No"]
    
    var navView: UIView?
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        navView = createNavView()
        if let nav = navView, let menuButton = nav.subviews.first(where: {$0 is UIButton}) as? UIButton {
            menuButton.addTarget(self, action: #selector(sideMenuPressed(sender:)), for: .touchUpInside)
            view.addSubview(nav)
        }
        addViews()
        placeViews()
        
        addIntoBodyView()
        placeBodyViews()
        
        nextButton.isHidden = true
        backButton.isHidden = true
        introductionLabel.text = "Patient"
        
        progressView.setProgress(0.25, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func addViews() {
        headerView.addSubview(introductionLabel)
        headerView.addSubview(progressView)
        view.addSubview(headerView)
        bottomView.addSubview(nextButton)
        bottomView.addSubview(backButton)
        view.addSubview(bottomView)
        view.addSubview(bodyBaseView)
        
    }
    
    private func placeViews() {
        if let nav = navView {
            headerView.topAnchor.constraint(equalTo: nav.bottomAnchor, constant: 0).isActive = true
        } else {
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60).isActive = true
        }
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        introductionLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 12).isActive = true
        introductionLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 30).isActive = true
        introductionLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        introductionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        progressView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 23).isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        bottomView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        nextButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        backButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        bodyBaseView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        bodyBaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bodyBaseView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bodyBaseView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
    }
    
    func addIntoBodyView() {
        scrollBaseView.addSubview(questionnaireHeading)
        scrollBaseView.addSubview(travelQuestionnaireCheckIcon)
        scrollBaseView.addSubview(startQuestionnaireButton)
        scrollBaseView.addSubview(middleSeparator)
        scrollBaseView.addSubview(intersectionCalculatorHeading)
        scrollBaseView.addSubview(intersectionCalculatorCheckIcon)
        scrollBaseView.addSubview(startintersectionCalculatorButton)
        scrollBaseView.addSubview(endSeparator)
        
        bodyBaseView.addSubview(scrollBaseView)
    }
    
    func placeBodyViews() {
        
        scrollBaseView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        scrollBaseView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        scrollBaseView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        scrollBaseView.heightAnchor.constraint(equalTo: bodyBaseView.heightAnchor).isActive = true
        
        questionnaireHeading.topAnchor.constraint(equalTo: scrollBaseView.topAnchor, constant: 30).isActive = true
        questionnaireHeading.centerXAnchor.constraint(equalTo: scrollBaseView.centerXAnchor).isActive = true
        questionnaireHeading.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        questionnaireHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        travelQuestionnaireCheckIcon.topAnchor.constraint(equalTo: questionnaireHeading.bottomAnchor, constant: 5).isActive = true
        travelQuestionnaireCheckIcon.centerXAnchor.constraint(equalTo: scrollBaseView.centerXAnchor).isActive = true
        travelQuestionnaireCheckIcon.widthAnchor.constraint(equalToConstant: 200).isActive = true
        travelQuestionnaireCheckIcon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        startQuestionnaireButton.topAnchor.constraint(equalTo: travelQuestionnaireCheckIcon.bottomAnchor, constant: 10).isActive = true
        startQuestionnaireButton.centerXAnchor.constraint(equalTo: scrollBaseView.centerXAnchor).isActive = true
        startQuestionnaireButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        startQuestionnaireButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        middleSeparator.topAnchor.constraint(equalTo: startQuestionnaireButton.bottomAnchor, constant: 10).isActive = true
        middleSeparator.leadingAnchor.constraint(equalTo: scrollBaseView.leadingAnchor).isActive = true
        middleSeparator.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        middleSeparator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        intersectionCalculatorHeading.topAnchor.constraint(equalTo: middleSeparator.bottomAnchor, constant: 50).isActive = true
        intersectionCalculatorHeading.centerXAnchor.constraint(equalTo: scrollBaseView.centerXAnchor).isActive = true
        intersectionCalculatorHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        intersectionCalculatorHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        intersectionCalculatorCheckIcon.topAnchor.constraint(equalTo: intersectionCalculatorHeading.bottomAnchor, constant: 5).isActive = true
        intersectionCalculatorCheckIcon.centerXAnchor.constraint(equalTo: scrollBaseView.centerXAnchor).isActive = true
        intersectionCalculatorCheckIcon.widthAnchor.constraint(equalToConstant: 200).isActive = true
        intersectionCalculatorCheckIcon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        startintersectionCalculatorButton.topAnchor.constraint(equalTo: intersectionCalculatorCheckIcon.bottomAnchor, constant: 10).isActive = true
        startintersectionCalculatorButton.centerXAnchor.constraint(equalTo: scrollBaseView.centerXAnchor).isActive = true
        startintersectionCalculatorButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        startintersectionCalculatorButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        endSeparator.topAnchor.constraint(equalTo: startintersectionCalculatorButton.bottomAnchor, constant: 10).isActive = true
        endSeparator.leadingAnchor.constraint(equalTo: scrollBaseView.leadingAnchor).isActive = true
        endSeparator.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        endSeparator.heightAnchor.constraint(equalToConstant: 3).isActive = true
    }
    
    @objc func sideMenuPressed(sender: UIButton) {
        print("Side menu pressed.")
    }
    
    @objc func nextButtonIsTapped(sender: UIButton) {
        print("Next button is pressed.")
        
    }
    
    @objc func backButtonIsTapped(sender: UIButton) {
        print("Back button is pressed.")
    }
    
    @objc func startQuestionnairePressed(sender: UIButton) {
        print("Questionnaire button is pressed.")
        let vc = TravelQuestionnaireFirstViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func startIntersectionCalculationIsPressed(sender: UIButton) {
        print("Intersection calculator is pressed.")
        let vc = IntersectionCalcutorIntroViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
