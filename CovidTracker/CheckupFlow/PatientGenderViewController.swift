//
//  PatientGenderViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/11.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class PatientGenderViewController: CheckupViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let genderSelectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "Please select your gender"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "HelveticaNeue", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let femaleButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        view.layer.cornerRadius =  8.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(rgb: 0x49D581).cgColor
        view.setTitleColor(.black, for: .normal)
        view.contentHorizontalAlignment = .left
        view.setImage(UIImage(named: "femaleicon"), for: .normal)
        view.setTitle("Female", for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 0)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        view.backgroundColor = UIColor(rgb: 0xF6F6F6)
        view.addTarget(self, action: #selector(nextButtonIsTapped(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let maleButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        view.layer.cornerRadius =  8.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(rgb: 0x49D581).cgColor
        view.setTitleColor(.black, for: .normal)
        view.contentHorizontalAlignment = .left
        view.setImage(UIImage(named: "maleicon"), for: .normal)
        view.setTitle("Male", for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 0)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 43, bottom: 0, right: 0)
        view.backgroundColor = UIColor(rgb: 0xF6F6F6)
        view.addTarget(self, action: #selector(nextButtonIsTapped(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let othersButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        view.layer.cornerRadius =  8.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(rgb: 0x49D581).cgColor
        view.setTitleColor(.black, for: .normal)
        view.contentHorizontalAlignment = .left
        view.setImage(UIImage(named: "othersicon"), for: .normal)
        view.setTitle("Others", for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 0)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        view.backgroundColor = UIColor(rgb: 0xF6F6F6)
        view.addTarget(self, action: #selector(nextButtonIsTapped(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.isHidden = false
        nextButton.isHidden = true
        introductionLabel.text = "Patient"
    }
    
    override func addIntoBodyView() {
        bodyBaseView.addSubview(genderSelectionHeading)
        bodyBaseView.addSubview(femaleButton)
        bodyBaseView.addSubview(maleButton)
        bodyBaseView.addSubview(othersButton)
    }
    
    override func placeBodyViews() {
        genderSelectionHeading.topAnchor.constraint(equalTo: bodyBaseView.topAnchor, constant: 20).isActive = true
        genderSelectionHeading.centerXAnchor.constraint(equalTo: bodyBaseView.centerXAnchor).isActive = true
        genderSelectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        genderSelectionHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        femaleButton.topAnchor.constraint(equalTo: genderSelectionHeading.bottomAnchor, constant: 30).isActive = true
        femaleButton.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 30).isActive = true
        femaleButton.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -30).isActive = true
        femaleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        maleButton.topAnchor.constraint(equalTo: femaleButton.bottomAnchor, constant: 10).isActive = true
        maleButton.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 30).isActive = true
        maleButton.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -30).isActive = true
        maleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        othersButton.topAnchor.constraint(equalTo: maleButton.bottomAnchor, constant: 10).isActive = true
        othersButton.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 30).isActive = true
        othersButton.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -30).isActive = true
        othersButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        print("Patient gender back button is tapped.")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        print("Patient gender next button is tapped.")
        let nextVC = PatientPhysicalInformationViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
