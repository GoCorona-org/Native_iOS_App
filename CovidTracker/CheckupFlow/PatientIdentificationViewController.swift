//
//  PatientIdentificationViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/11.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class PatientIdentificationViewController: CheckupViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let patientIdentificationHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "Tell us who this check up is for?"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "HelveticaNeue", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let selfButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        view.layer.cornerRadius =  8.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(rgb: 0x49D581).cgColor
        view.setTitleColor(.black, for: .normal)
        view.contentHorizontalAlignment = .left
        view.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        view.setTitle("Self", for: .normal)
        view.backgroundColor = UIColor(rgb: 0xF6F6F6)
        view.addTarget(self, action: #selector(nextButtonIsTapped(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let assistOthersButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        view.layer.cornerRadius =  8.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(rgb: 0x49D581).cgColor
        view.setTitleColor(.black, for: .normal)
        view.contentHorizontalAlignment = .left
        view.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        view.setTitle("Someone else and you're assisting them", for: .normal)
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.backgroundColor = UIColor(rgb: 0xF6F6F6)
        view.addTarget(self, action: #selector(nextButtonIsTapped(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let noSymptomHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "Or, if you don't have any symptoms"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "HelveticaNeue", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let exploreButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        view.layer.cornerRadius =  8.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(rgb: 0x49D581).cgColor
        view.setTitleColor(.black, for: .normal)
        view.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        view.contentHorizontalAlignment = .left
        view.setTitle("Explore", for: .normal)
        view.backgroundColor = UIColor(rgb: 0xF6F6F6)
        view.addTarget(self, action: #selector(nextButtonIsTapped(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = true
        backButton.isHidden = false
        introductionLabel.text = "Patient"
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        print("Patient back button is tapped.")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        print("Patient next button is tapped.")
        let nextVC = PatientGenderViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func addIntoBodyView() {
        bodyBaseView.addSubview(patientIdentificationHeading)
        bodyBaseView.addSubview(selfButton)
        bodyBaseView.addSubview(assistOthersButton)
        bodyBaseView.addSubview(noSymptomHeading)
        bodyBaseView.addSubview(exploreButton)
    }
    
    override func placeBodyViews() {
        patientIdentificationHeading.topAnchor.constraint(equalTo: bodyBaseView.topAnchor, constant: 20).isActive = true
        patientIdentificationHeading.centerXAnchor.constraint(equalTo: bodyBaseView.centerXAnchor).isActive = true
        patientIdentificationHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        patientIdentificationHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        selfButton.topAnchor.constraint(equalTo: patientIdentificationHeading.bottomAnchor, constant: 30).isActive = true
        selfButton.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 30).isActive = true
        selfButton.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -30).isActive = true
        selfButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        assistOthersButton.topAnchor.constraint(equalTo: selfButton.bottomAnchor, constant: 10).isActive = true
        assistOthersButton.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 30).isActive = true
        assistOthersButton.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -30).isActive = true
        assistOthersButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        noSymptomHeading.centerYAnchor.constraint(equalTo: bodyBaseView.centerYAnchor, constant: 10).isActive = true
        noSymptomHeading.centerXAnchor.constraint(equalTo: bodyBaseView.centerXAnchor).isActive = true
        noSymptomHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        noSymptomHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        exploreButton.topAnchor.constraint(equalTo: noSymptomHeading.bottomAnchor, constant: 30).isActive = true
        exploreButton.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 30).isActive = true
        exploreButton.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -30).isActive = true
        exploreButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
