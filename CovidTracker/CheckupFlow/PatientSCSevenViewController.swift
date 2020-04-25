//
//  PatientSCSevenViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/25.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class PatientSCSevenViewController: CheckupViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        var finalHeight: CGFloat = 0.0
        if let size = bodySize  {
            finalHeight = size.height
        } else {
            finalHeight = 700.0
        }
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: finalHeight)
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: finalHeight + 300)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let symptomCheckHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "How long have you had these symptoms for?"
        view.textAlignment = .left
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Medium", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pageicon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 230)
        view.image = UIImage(named: "patientscsevencheck")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Select the number of days for each"
        view.textAlignment = .left
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSeparator: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 5)
        view.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Fever"
        view.textAlignment = .left
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever1WeekButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("1 week", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 1
        view.addTarget(self, action: #selector(feverButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever2WeekButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("2 weeks", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 2
        view.addTarget(self, action: #selector(feverButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever3WeekButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("3 weeks", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 3
        view.addTarget(self, action: #selector(feverButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let feverLessThanWeekButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("Less", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 0
        view.addTarget(self, action: #selector(feverButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thirdSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Cough"
        view.textAlignment = .left
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coughLevel1Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("1", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 1
        view.addTarget(self, action: #selector(coughButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coughLevel2Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("2", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 2
        view.addTarget(self, action: #selector(coughButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coughLevel3Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("3", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 3
        view.addTarget(self, action: #selector(coughButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coughLevel4Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("4", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 4
        view.addTarget(self, action: #selector(coughButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coughLevel5Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("5", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 5
        view.addTarget(self, action: #selector(coughButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coughLevelMoreButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("More", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 6
        view.addTarget(self, action: #selector(coughButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fourthSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Headache"
        view.textAlignment = .left
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headacheLevel1Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("1", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 1
        view.addTarget(self, action: #selector(headacheButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headacheLevel2Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("2", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 2
        view.addTarget(self, action: #selector(headacheButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headacheLevel3Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("3", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 3
        view.addTarget(self, action: #selector(headacheButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headacheLevel4Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("4", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 4
        view.addTarget(self, action: #selector(headacheButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headacheLevel5Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("5", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 5
        view.addTarget(self, action: #selector(headacheButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headacheLevelMoreButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor  = .white
        view.setTitle("More", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x707070), for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Light", size: 14.0)
        view.tag = 6
        view.addTarget(self, action: #selector(headacheButtonPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fifthSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "How have the symptoms progressed over the last 48 hours?"
        view.numberOfLines = 2
        view.lineBreakMode =  .byWordWrapping
        view.textAlignment = .left
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let conditionLevel1Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.cornerRadius = 8.0
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 1
        view.addTarget(self, action: #selector(conditionLevelPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let conditionLevel2Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 2
        view.addTarget(self, action: #selector(conditionLevelPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let conditionLevel3Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 3
        view.addTarget(self, action: #selector(conditionLevelPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let conditionLevel4Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 4
        view.addTarget(self, action: #selector(conditionLevelPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let conditionLevel5Button: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        view.layer.cornerRadius = 8.0
        view.layer.maskedCorners = [.layerMaxXMinYCorner]
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 5
        view.addTarget(self, action: #selector(conditionLevelPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let extensionLeftView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1, height: 5)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let extensionRightView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1, height: 5)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let improvedLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        view.text = "Improved"
        view.font = UIFont(name: "FiraSans-Regular", size: 12)
        view.textAlignment = .center
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let noChangeLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        view.text = "No change"
        view.font = UIFont(name: "FiraSans-Regular", size: 12)
        view.textAlignment = .center
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let worsenedLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        view.text = "Worsened"
        view.font = UIFont(name: "FiraSans-Regular", size: 12)
        view.textAlignment = .center
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let worsenedMildlyLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        view.text = "Worsened Mildly"
        view.font = UIFont(name: "FiraSans-Regular", size: 12)
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let worsenedConsiderablyLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        view.text = "Worsened Considerably"
        view.font = UIFont(name: "FiraSans-Regular", size: 12)
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let selectedConditionImageView: UIImageView = {
        let view = UIImageView()
        let symbol = UIImage.SymbolConfiguration(pointSize: 15.0, weight: .light)
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.image = UIImage(systemName: "arrowtriangle.up.fill", withConfiguration: symbol)
        view.tintColor = .black
        view.isHidden = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.isHidden = false
        nextButton.isHidden = false
        introductionLabel.text = "Patient"
    }
    
    override func addIntoBodyView() {
        
        scrollView.addSubview(symptomCheckHeading)
        scrollView.addSubview(pageicon)
        
        scrollView.addSubview(firstSectionHeading)
        scrollView.addSubview(firstSeparator)
        
        scrollView.addSubview(secondSectionHeading)
        scrollView.addSubview(fever1WeekButton)
        scrollView.addSubview(fever2WeekButton)
        scrollView.addSubview(fever3WeekButton)
        scrollView.addSubview(feverLessThanWeekButton)
        
        scrollView.addSubview(thirdSectionHeading)
        scrollView.addSubview(coughLevel1Button)
        scrollView.addSubview(coughLevel2Button)
        scrollView.addSubview(coughLevel3Button)
        scrollView.addSubview(coughLevel4Button)
        scrollView.addSubview(coughLevel5Button)
        scrollView.addSubview(coughLevelMoreButton)
        
        scrollView.addSubview(fourthSectionHeading)
        scrollView.addSubview(headacheLevel1Button)
        scrollView.addSubview(headacheLevel2Button)
        scrollView.addSubview(headacheLevel3Button)
        scrollView.addSubview(headacheLevel4Button)
        scrollView.addSubview(headacheLevel5Button)
        scrollView.addSubview(headacheLevelMoreButton)
        
        scrollView.addSubview(fifthSectionHeading)
        scrollView.addSubview(conditionLevel1Button)
        scrollView.addSubview(conditionLevel2Button)
        scrollView.addSubview(conditionLevel3Button)
        scrollView.addSubview(conditionLevel4Button)
        scrollView.addSubview(conditionLevel5Button)
        scrollView.addSubview(extensionLeftView)
        scrollView.addSubview(extensionRightView)
        scrollView.addSubview(improvedLabel)
        scrollView.addSubview(noChangeLabel)
        scrollView.addSubview(worsenedLabel)
        scrollView.addSubview(worsenedMildlyLabel)
        scrollView.addSubview(worsenedConsiderablyLabel)
        scrollView.addSubview(selectedConditionImageView)
        
        bodyBaseView.addSubview(scrollView)
    }
    
    override func placeBodyViews() {
        let dividerSpace = (UIScreen.main.bounds.width  - (40*6) - (35*2))  /  5
        let feverButtonWidth = (UIScreen.main.bounds.width - (35*2) - (10*3)) / 4
        let conditionLevelWidth = (UIScreen.main.bounds.width - (35*2) - (2*4)) / 5
        
        scrollView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: bodyBaseView.heightAnchor).isActive = true
        
        
        symptomCheckHeading.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        symptomCheckHeading.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30).isActive = true
        symptomCheckHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        symptomCheckHeading.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pageicon.topAnchor.constraint(equalTo: symptomCheckHeading.bottomAnchor, constant: 20).isActive = true
        pageicon.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        pageicon.widthAnchor.constraint(equalToConstant: 220).isActive = true
        pageicon.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        firstSectionHeading.topAnchor.constraint(equalTo: pageicon.bottomAnchor, constant: 20).isActive = true
        firstSectionHeading.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        firstSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        firstSectionHeading.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        firstSeparator.topAnchor.constraint(equalTo: firstSectionHeading.bottomAnchor, constant: 5).isActive  = true
        firstSeparator.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        firstSeparator.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        firstSeparator.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        
        secondSectionHeading.topAnchor.constraint(equalTo: firstSeparator.bottomAnchor, constant: 5).isActive = true
        secondSectionHeading.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        secondSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        secondSectionHeading.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        fever1WeekButton.topAnchor.constraint(equalTo: secondSectionHeading.bottomAnchor, constant: 5).isActive = true
        fever1WeekButton.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        fever1WeekButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever1WeekButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever2WeekButton.topAnchor.constraint(equalTo: secondSectionHeading.bottomAnchor, constant: 5).isActive = true
        fever2WeekButton.leadingAnchor.constraint(equalTo: fever1WeekButton.trailingAnchor, constant: 10).isActive = true
        fever2WeekButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever2WeekButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever3WeekButton.topAnchor.constraint(equalTo: secondSectionHeading.bottomAnchor, constant: 5).isActive = true
        fever3WeekButton.leadingAnchor.constraint(equalTo: fever2WeekButton.trailingAnchor, constant: 10).isActive = true
        fever3WeekButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever3WeekButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        feverLessThanWeekButton.topAnchor.constraint(equalTo: secondSectionHeading.bottomAnchor, constant: 5).isActive = true
        feverLessThanWeekButton.leadingAnchor.constraint(equalTo: fever3WeekButton.trailingAnchor, constant: 10).isActive = true
        feverLessThanWeekButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        feverLessThanWeekButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        thirdSectionHeading.topAnchor.constraint(equalTo: fever1WeekButton.bottomAnchor, constant: 10).isActive = true
        thirdSectionHeading.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        thirdSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        thirdSectionHeading.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        coughLevel1Button.topAnchor.constraint(equalTo: thirdSectionHeading.bottomAnchor, constant: 5).isActive = true
        coughLevel1Button.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        coughLevel1Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        coughLevel1Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        coughLevel2Button.topAnchor.constraint(equalTo: thirdSectionHeading.bottomAnchor, constant: 5).isActive = true
        coughLevel2Button.leadingAnchor.constraint(equalTo: coughLevel1Button.trailingAnchor, constant: dividerSpace).isActive = true
        coughLevel2Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        coughLevel2Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        coughLevel3Button.topAnchor.constraint(equalTo: thirdSectionHeading.bottomAnchor, constant: 5).isActive = true
        coughLevel3Button.leadingAnchor.constraint(equalTo: coughLevel2Button.trailingAnchor, constant: dividerSpace).isActive = true
        coughLevel3Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        coughLevel3Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        coughLevel4Button.topAnchor.constraint(equalTo: thirdSectionHeading.bottomAnchor, constant: 5).isActive = true
        coughLevel4Button.leadingAnchor.constraint(equalTo: coughLevel3Button.trailingAnchor, constant: dividerSpace).isActive = true
        coughLevel4Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        coughLevel4Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        coughLevel5Button.topAnchor.constraint(equalTo: thirdSectionHeading.bottomAnchor, constant: 5).isActive = true
        coughLevel5Button.leadingAnchor.constraint(equalTo: coughLevel4Button.trailingAnchor, constant: dividerSpace).isActive = true
        coughLevel5Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        coughLevel5Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        coughLevelMoreButton.topAnchor.constraint(equalTo: thirdSectionHeading.bottomAnchor, constant: 5).isActive = true
        coughLevelMoreButton.leadingAnchor.constraint(equalTo: coughLevel5Button.trailingAnchor, constant: dividerSpace).isActive = true
        coughLevelMoreButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        coughLevelMoreButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fourthSectionHeading.topAnchor.constraint(equalTo: coughLevel1Button.bottomAnchor, constant: 10).isActive = true
        fourthSectionHeading.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        fourthSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        fourthSectionHeading.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        headacheLevel1Button.topAnchor.constraint(equalTo: fourthSectionHeading.bottomAnchor, constant: 5).isActive = true
        headacheLevel1Button.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        headacheLevel1Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        headacheLevel1Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        headacheLevel2Button.topAnchor.constraint(equalTo: fourthSectionHeading.bottomAnchor, constant: 5).isActive = true
        headacheLevel2Button.leadingAnchor.constraint(equalTo: headacheLevel1Button.trailingAnchor, constant: dividerSpace).isActive = true
        headacheLevel2Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        headacheLevel2Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        headacheLevel3Button.topAnchor.constraint(equalTo: fourthSectionHeading.bottomAnchor, constant: 5).isActive = true
        headacheLevel3Button.leadingAnchor.constraint(equalTo: headacheLevel2Button.trailingAnchor, constant: dividerSpace).isActive = true
        headacheLevel3Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        headacheLevel3Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        headacheLevel4Button.topAnchor.constraint(equalTo: fourthSectionHeading.bottomAnchor, constant: 5).isActive = true
        headacheLevel4Button.leadingAnchor.constraint(equalTo: headacheLevel3Button.trailingAnchor, constant: dividerSpace).isActive = true
        headacheLevel4Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        headacheLevel4Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        headacheLevel5Button.topAnchor.constraint(equalTo: fourthSectionHeading.bottomAnchor, constant: 5).isActive = true
        headacheLevel5Button.leadingAnchor.constraint(equalTo: headacheLevel4Button.trailingAnchor, constant: dividerSpace).isActive = true
        headacheLevel5Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        headacheLevel5Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        headacheLevelMoreButton.topAnchor.constraint(equalTo: fourthSectionHeading.bottomAnchor, constant: 5).isActive = true
        headacheLevelMoreButton.leadingAnchor.constraint(equalTo: headacheLevel5Button.trailingAnchor, constant: dividerSpace).isActive = true
        headacheLevelMoreButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        headacheLevelMoreButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fifthSectionHeading.topAnchor.constraint(equalTo: headacheLevel1Button.bottomAnchor, constant: 20).isActive = true
        fifthSectionHeading.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        fifthSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        fifthSectionHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        conditionLevel1Button.topAnchor.constraint(equalTo: fifthSectionHeading.bottomAnchor, constant: 5).isActive = true
        conditionLevel1Button.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        conditionLevel1Button.widthAnchor.constraint(equalToConstant: conditionLevelWidth).isActive = true
        conditionLevel1Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        conditionLevel2Button.topAnchor.constraint(equalTo: fifthSectionHeading.bottomAnchor, constant: 5).isActive = true
        conditionLevel2Button.leadingAnchor.constraint(equalTo: conditionLevel1Button.trailingAnchor, constant: 2).isActive = true
        conditionLevel2Button.widthAnchor.constraint(equalToConstant: conditionLevelWidth).isActive = true
        conditionLevel2Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        conditionLevel3Button.topAnchor.constraint(equalTo: fifthSectionHeading.bottomAnchor, constant: 5).isActive = true
        conditionLevel3Button.leadingAnchor.constraint(equalTo: conditionLevel2Button.trailingAnchor, constant: 2).isActive = true
        conditionLevel3Button.widthAnchor.constraint(equalToConstant: conditionLevelWidth).isActive = true
        conditionLevel3Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        conditionLevel4Button.topAnchor.constraint(equalTo: fifthSectionHeading.bottomAnchor, constant: 5).isActive = true
        conditionLevel4Button.leadingAnchor.constraint(equalTo: conditionLevel3Button.trailingAnchor, constant: 2).isActive = true
        conditionLevel4Button.widthAnchor.constraint(equalToConstant: conditionLevelWidth).isActive = true
        conditionLevel4Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        conditionLevel5Button.topAnchor.constraint(equalTo: fifthSectionHeading.bottomAnchor, constant: 5).isActive = true
        conditionLevel5Button.leadingAnchor.constraint(equalTo: conditionLevel4Button.trailingAnchor, constant: 2).isActive = true
        conditionLevel5Button.widthAnchor.constraint(equalToConstant: conditionLevelWidth).isActive = true
        conditionLevel5Button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        extensionLeftView.topAnchor.constraint(equalTo: conditionLevel1Button.bottomAnchor).isActive = true
        extensionLeftView.leadingAnchor.constraint(equalTo: conditionLevel1Button.leadingAnchor).isActive = true
        extensionLeftView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        extensionLeftView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        extensionRightView.topAnchor.constraint(equalTo: conditionLevel5Button.bottomAnchor).isActive = true
        extensionRightView.trailingAnchor.constraint(equalTo: conditionLevel5Button.trailingAnchor).isActive = true
        extensionRightView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        extensionRightView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        improvedLabel.topAnchor.constraint(equalTo: extensionLeftView.bottomAnchor, constant: 1).isActive = true
        improvedLabel.centerXAnchor.constraint(equalTo: conditionLevel1Button.centerXAnchor).isActive = true
        improvedLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        improvedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        noChangeLabel.topAnchor.constraint(equalTo: extensionLeftView.bottomAnchor, constant: 1).isActive = true
        noChangeLabel.centerXAnchor.constraint(equalTo: conditionLevel2Button.centerXAnchor).isActive = true
        noChangeLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        noChangeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        worsenedLabel.topAnchor.constraint(equalTo: extensionLeftView.bottomAnchor, constant: 1).isActive = true
        worsenedLabel.centerXAnchor.constraint(equalTo: conditionLevel3Button.centerXAnchor).isActive = true
        worsenedLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        worsenedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        worsenedMildlyLabel.topAnchor.constraint(equalTo: extensionLeftView.bottomAnchor, constant: 3).isActive = true
        worsenedMildlyLabel.centerXAnchor.constraint(equalTo: conditionLevel4Button.centerXAnchor).isActive = true
        worsenedMildlyLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        worsenedMildlyLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        worsenedConsiderablyLabel.topAnchor.constraint(equalTo: extensionLeftView.bottomAnchor, constant: 3).isActive = true
        worsenedConsiderablyLabel.centerXAnchor.constraint(equalTo: conditionLevel5Button.centerXAnchor).isActive = true
        worsenedConsiderablyLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        worsenedConsiderablyLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        print("Navigate to the new VC.")
        let vc = CheckupSubmitViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func feverButtonPressed(sender: UIButton) {
        print("Fever button is pressed for the \(sender.tag) week.")
    }
    
    @objc func coughButtonPressed(sender: UIButton) {
        print("Cough button is pressed for the \(sender.tag) level.")
    }
    
    @objc func headacheButtonPressed(sender: UIButton) {
        print("Headache button is pressed for the \(sender.tag) level.")
    }
    
    @objc func conditionLevelPressed(sender: UIButton) {
        clearSelectedConditionButton()
        selectedConditionImageView.isHidden = false
        if sender.tag == 1 {
            selectedConditionImageView.center = conditionLevel1Button.center
            selectedConditionImageView.center.y = conditionLevel1Button.frame.maxY + 10
        } else if sender.tag == 2 {
            selectedConditionImageView.center = conditionLevel2Button.center
            selectedConditionImageView.center.y = conditionLevel2Button.frame.maxY + 10
        } else if sender.tag == 3 {
            selectedConditionImageView.center = conditionLevel3Button.center
            selectedConditionImageView.center.y = conditionLevel3Button.frame.maxY + 10
        } else if sender.tag == 4 {
            selectedConditionImageView.center = conditionLevel4Button.center
            selectedConditionImageView.center.y = conditionLevel4Button.frame.maxY + 10
        } else if sender.tag == 5 {
            selectedConditionImageView.center = conditionLevel5Button.center
            selectedConditionImageView.center.y = conditionLevel5Button.frame.maxY + 10
        }
        sender.backgroundColor = UIColor(rgb: 0xA9E7CB)
        print("Condition button is pressed with the \(sender.tag) level.")
    }
    
    private func clearSelectedConditionButton() {
        conditionLevel1Button.backgroundColor = UIColor(rgb: 0xE4E4E4)
        conditionLevel2Button.backgroundColor = UIColor(rgb: 0xE4E4E4)
        conditionLevel3Button.backgroundColor = UIColor(rgb: 0xE4E4E4)
        conditionLevel4Button.backgroundColor = UIColor(rgb: 0xE4E4E4)
        conditionLevel5Button.backgroundColor = UIColor(rgb: 0xE4E4E4)
    }
}
