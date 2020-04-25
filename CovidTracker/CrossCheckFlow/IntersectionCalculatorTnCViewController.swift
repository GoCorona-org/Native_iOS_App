//
//  IntersectionCalculatorTnCViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/20.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class IntersectionCalculatorTnCViewController: CrossCheckViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let tAndCIcon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 210)
        view.image = UIImage(named: "checkuptnc")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tAndCDescriptionText: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.image = UIImage(named: "intersectiontnctext")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let checkbox: Checkbox = {
        let view = Checkbox()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.borderStyle = .square
        view.checkmarkStyle = .tick
        view.checkboxFillColor = UIColor(red: 239, green: 239, blue: 239)
        view.useHapticFeedback = true
        view.uncheckedBorderColor = UIColor.gray
        view.checkedBorderColor = UIColor(red: 231, green: 46, blue: 104)
        view.checkmarkColor = UIColor(red: 231, green: 46, blue: 104)
        view.borderCornerRadius = 8.0
        view.checkmarkSize = 0.75
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let agreementLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        let mut1 = NSMutableAttributedString(string: "I've read and accept the ", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0), NSMutableAttributedString.Key.foregroundColor: UIColor(red: 153, green: 153, blue: 153)])
        let mut2 = NSMutableAttributedString(string: "Terms and Conditions", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0), NSMutableAttributedString.Key.foregroundColor: UIColor(red: 59, green: 36, blue: 178)])
        mut1.append(mut2)
        label.attributedText = mut1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introductionLabel.text = "Patient"
        backButton.isHidden = false
        nextButton.isHidden = false
    }
    
    override func addIntoBodyView() {
        bodyBaseView.addSubview(tAndCIcon)
        bodyBaseView.addSubview(tAndCDescriptionText)
        bodyBaseView.addSubview(checkbox)
        bodyBaseView.addSubview(agreementLabel)
    }
    
    override func placeBodyViews() {
        tAndCIcon.centerXAnchor.constraint(equalTo: bodyBaseView.centerXAnchor).isActive = true
        tAndCIcon.topAnchor.constraint(equalTo: bodyBaseView.topAnchor, constant: 10).isActive = true
        tAndCIcon.widthAnchor.constraint(equalToConstant: 220).isActive = true
        tAndCIcon.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        tAndCDescriptionText.centerXAnchor.constraint(equalTo: bodyBaseView.centerXAnchor).isActive = true
        tAndCDescriptionText.topAnchor.constraint(equalTo: tAndCIcon.bottomAnchor, constant: 10).isActive = true
        tAndCDescriptionText.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant:
        40).isActive = true
        tAndCDescriptionText.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -40).isActive = true
        tAndCDescriptionText.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        checkbox.topAnchor.constraint(equalTo: tAndCDescriptionText.bottomAnchor, constant: 10).isActive = true
        checkbox.leadingAnchor.constraint(equalTo: tAndCDescriptionText.leadingAnchor).isActive  = true
        checkbox.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkbox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        agreementLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 10).isActive = true
        agreementLabel.centerYAnchor.constraint(equalTo: checkbox.centerYAnchor).isActive = true
        agreementLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        agreementLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        let vc = LocationHistoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
