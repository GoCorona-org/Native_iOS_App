//
//  CheckupViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/11.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class CheckupViewController: UIViewController {
    
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
        view.font = UIFont(name: "HelveticaNeue", size: 16)
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
    
    let introIcon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 210)
        view.image = UIImage(named: "checkupintroicon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let introDescriptionTextIcon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.image = UIImage(named: "checkupintrotext")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var navView: UIView?
    
    let options = ["Yes", "No"]
    
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
        
        backButton.isHidden = true
        
        checkupProgress = checkupProgress + 0.0769 //Total no of pages in the flow are 13 and the progress view's value ranges from 0 to 1. Therefore, each time page trasition occurs we increase it by 0.07142
        progressView.setProgress(checkupProgress, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        bodySize = bodyBaseView.frame.size
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
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        bodyBaseView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        bodyBaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bodyBaseView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bodyBaseView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
    }
    
    @objc func sideMenuPressed(sender: UIButton) {
        print("Side menu pressed.")
    }
    
    @objc func nextButtonIsTapped(sender: UIButton) {
        print("Next button is pressed.")
        let checkupTnC = CheckupTermsViewController()
        self.navigationController?.pushViewController(checkupTnC, animated: true)
    }
    
    @objc func backButtonIsTapped(sender: UIButton) {
        print("Back button is pressed.")
    }
    
    func addIntoBodyView() {
        scrollBaseView.addSubview(introIcon)
        scrollBaseView.addSubview(introDescriptionTextIcon)
        
        bodyBaseView.addSubview(scrollBaseView)
    }
    
    func placeBodyViews() {
        
        scrollBaseView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        scrollBaseView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        scrollBaseView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        scrollBaseView.heightAnchor.constraint(equalTo: bodyBaseView.heightAnchor).isActive = true
        
        introIcon.topAnchor.constraint(equalTo: scrollBaseView.topAnchor, constant: 30).isActive = true
        introIcon.centerXAnchor.constraint(equalTo: scrollBaseView.centerXAnchor).isActive = true
        introIcon.widthAnchor.constraint(equalToConstant: 220).isActive = true
        introIcon.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        introDescriptionTextIcon.topAnchor.constraint(equalTo: introIcon.bottomAnchor, constant: 0).isActive = true
        introDescriptionTextIcon.centerXAnchor.constraint(equalTo: bodyBaseView.centerXAnchor).isActive = true
        introDescriptionTextIcon.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (2*35)).isActive = true
        introDescriptionTextIcon.heightAnchor.constraint(equalToConstant: 330).isActive = true
    }
}
