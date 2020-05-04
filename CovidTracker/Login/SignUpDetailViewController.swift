//
//  File.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/10.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class SignUpDetailViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let ageField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.autocorrectionType = .no
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(rgb: 0x282828).cgColor
        view.layer.borderWidth = 0.5
        view.text = "Age"
        view.font = UIFont(name: "FiraSans-Bold", size: 13)
        view.textColor = UIColor(rgb:  0x989898)
        view.backgroundColor = UIColor(rgb: 0xEEEEEE)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.keyboardType = .numberPad
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let genderField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.autocorrectionType = .no
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(rgb: 0x282828).cgColor
        view.layer.borderWidth = 0.5
        view.text = "Gender"
        view.font = UIFont(name: "FiraSans-Bold", size: 13)
        view.textColor = UIColor(rgb:  0x989898)
        view.backgroundColor = UIColor(rgb: 0xEEEEEE)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let phNumberField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.autocorrectionType = .no
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(rgb: 0x282828).cgColor
        view.layer.borderWidth = 0.5
        view.text = "Phone Number"
        view.font = UIFont(name: "FiraSans-Bold", size: 13)
        view.textColor = UIColor(rgb:  0x989898)
        view.backgroundColor = UIColor(rgb: 0xEEEEEE)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.keyboardType = .numberPad
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.autocorrectionType = .no
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(rgb: 0x282828).cgColor
        view.layer.borderWidth = 0.5
        view.text = "Password"
        view.font = UIFont(name: "FiraSans-Bold", size: 13)
        view.textColor = UIColor(rgb:  0x989898)
        view.backgroundColor = UIColor(rgb: 0xEEEEEE)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.isSecureTextEntry = true
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let checkbox: Checkbox = {
        let view = Checkbox()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.borderStyle = .square
        view.checkmarkStyle = .tick
        view.checkboxFillColor = UIColor(rgb: 0xF6F6F6)
        view.useHapticFeedback = true
        view.uncheckedBorderColor = UIColor(rgb: 0x989898)
        view.checkedBorderColor = UIColor(red: 231, green: 46, blue: 104)
        view.checkmarkColor = UIColor(red: 231, green: 46, blue: 104)
        view.checkmarkSize = 0.75
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let agreementLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        let mut1 = NSMutableAttributedString(string: "I've read and agreed to ", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "FiraSans-Bold", size: 12) ?? UIFont.systemFont(ofSize: 12.0), NSMutableAttributedString.Key.foregroundColor: UIColor(rgb:  0x989898)])
        let mut2 = NSMutableAttributedString(string: "Terms and Conditions", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "FiraSans-Bold", size: 12) ?? UIFont.systemFont(ofSize: 12.0), NSMutableAttributedString.Key.foregroundColor: UIColor(rgb: 0x3B24B1)])
        mut1.append(mut2)
        label.attributedText = mut1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        return label
    }()
    
    let sendOTPButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        view.setTitle("Send OTP", for: .normal)
        view.layer.cornerRadius = view.frame.height/2.2
        view.backgroundColor = UIColor(rgb: 0xE03D51)
        view.titleLabel?.font = UIFont(name: "FiraSans-Regular", size: 20.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(sendOTPButtonTapped(sender:)), for: .touchUpInside)
        return view
    }()
    
    let signInLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.text = "Already have an account? "
        label.textAlignment = .center
        label.font = UIFont(name: "FiraSans-Regular", size: 12)
        label.textColor = UIColor(rgb: 0x989898)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraSans-ExtraBold", size: 12)
        button.setTitleColor(UIColor(rgb: 0x3B24B1), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(signInButtonTapped(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    let agreementView: UIView = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        let blurEffect = UIBlurEffect.init(style: .light)
        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
        let bluredView = UIVisualEffectView.init(effect: blurEffect)
        bluredView.contentView.addSubview(visualEffect)
        visualEffect.frame = UIScreen.main.bounds
        bluredView.frame = UIScreen.main.bounds
        view.addSubview(bluredView)
        view.isHidden = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let agreementHeader: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        view.text = "Terms and Conditions"
        view.font = UIFont(name: "FiraSans-SemiBold", size: 13)
        view.textColor = UIColor(red: 59, green: 36, blue: 178)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let agreementFirst: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 130)
        view.text = "Your personal information including your location and medical history collected will remain confidential and will not be shared with any third party providers, advertisers or other Spot-Corona users."
        view.font = UIFont(name: "FiraSans-Regular", size: 13)
        view.textColor = UIColor(rgb: 0x383838)
        view.textAlignment = .left
        view.numberOfLines = 6
        view.setLineHeight(lineHeight: 1.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let agreementSecond: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 130)
        view.text = "The information collected is strictly used to help track the spread of COVID-19 in your area and to help serve the general public."
        view.font = UIFont(name: "FiraSans-Regular", size: 13)
        view.textColor = UIColor(rgb: 0x383838)
        view.textAlignment = .left
        view.numberOfLines = 4
        view.setLineHeight(lineHeight: 1.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let agreementThird: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 130)
        view.text = "You will be notified of any changes to this policy and your information will not be used for any other purposes without prior notice and approval from your end."
        view.font = UIFont(name: "FiraSans-Regular", size: 13)
        view.textColor = UIColor(rgb: 0x383838)
        view.textAlignment = .left
        view.numberOfLines = 4
        view.setLineHeight(lineHeight: 1.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backButton: UIButton = {
        let view = UIButton()
        view.frame =  CGRect(x: 0, y: 0, width: 100, height: 40)
        view.titleLabel?.textAlignment = .center
        view.setTitle("< Back", for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Regular" , size: 17)
        view.setTitleColor(UIColor(rgb: 0x3B24B1), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(backButtonIsTapped(sender:)), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        addViews()
        placeViews()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTap))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
        
        let agreementTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnUserAgreements(gesture:)))
        agreementTapGesture.numberOfTapsRequired = 1
        agreementLabel.addGestureRecognizer(agreementTapGesture)
        
        let dismissAgreementTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissAgreementView))
        dismissAgreementTapGesture.numberOfTapsRequired = 1
        agreementView.addGestureRecognizer(dismissAgreementTapGesture)
    }
    
    private func addViews() {
        view.addSubview(ageField)
        view.addSubview(genderField)
        view.addSubview(phNumberField)
        view.addSubview(passwordField)
        view.addSubview(checkbox)
        view.addSubview(agreementLabel)
        view.addSubview(sendOTPButton)
        view.addSubview(signInLabel)
        view.addSubview(signInButton)
        
        agreementView.addSubview(agreementHeader)
        agreementView.addSubview(agreementFirst)
        agreementView.addSubview(agreementSecond)
        agreementView.addSubview(agreementThird)
        agreementView.addSubview(backButton)
        view.addSubview(agreementView)
    }
    
    private func placeViews() {
        ageField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 70).isActive = true
        ageField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20).isActive = true
        ageField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20).isActive = true
        ageField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        genderField.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 25).isActive = true
        genderField.leadingAnchor.constraint(equalTo: ageField.leadingAnchor).isActive = true
        genderField.trailingAnchor.constraint(equalTo: ageField.trailingAnchor).isActive = true
        genderField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        phNumberField.topAnchor.constraint(equalTo: genderField.bottomAnchor, constant: 25).isActive = true
        phNumberField.leadingAnchor.constraint(equalTo: genderField.leadingAnchor).isActive = true
        phNumberField.trailingAnchor.constraint(equalTo: genderField.trailingAnchor).isActive = true
        phNumberField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        passwordField.topAnchor.constraint(equalTo: phNumberField.bottomAnchor, constant: 25).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: phNumberField.leadingAnchor).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: phNumberField.trailingAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        checkbox.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 25).isActive = true
        checkbox.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor).isActive  = true
        checkbox.widthAnchor.constraint(equalToConstant: 15).isActive = true
        checkbox.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        agreementLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 5).isActive = true
        agreementLabel.centerYAnchor.constraint(equalTo: checkbox.centerYAnchor).isActive = true
        agreementLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        agreementLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        sendOTPButton.topAnchor.constraint(equalTo: checkbox.bottomAnchor, constant: 40).isActive = true
        sendOTPButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendOTPButton.widthAnchor.constraint(equalToConstant: 210).isActive = true
        sendOTPButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        signInLabel.topAnchor.constraint(equalTo: sendOTPButton.bottomAnchor, constant: 40).isActive = true
        signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -25).isActive = true
        signInLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        signInLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        signInButton.topAnchor.constraint(equalTo: sendOTPButton.bottomAnchor, constant: 40).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: signInLabel.centerXAnchor, constant: 95).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        agreementHeader.topAnchor.constraint(equalTo: agreementView.topAnchor, constant: 100).isActive = true
        agreementHeader.centerXAnchor.constraint(equalTo: agreementView.centerXAnchor).isActive = true
        agreementHeader.widthAnchor.constraint(equalToConstant: 200).isActive = true
        agreementHeader.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        agreementFirst.topAnchor.constraint(equalTo: agreementHeader.bottomAnchor, constant: 10).isActive = true
        agreementFirst.centerXAnchor.constraint(equalTo: agreementView.centerXAnchor).isActive = true
        agreementFirst.widthAnchor.constraint(equalToConstant: 250).isActive = true
        agreementFirst.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        agreementSecond.topAnchor.constraint(equalTo: agreementFirst.bottomAnchor).isActive = true
        agreementSecond.centerXAnchor.constraint(equalTo: agreementView.centerXAnchor).isActive = true
        agreementSecond.widthAnchor.constraint(equalToConstant: 250).isActive = true
        agreementSecond.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        agreementThird.topAnchor.constraint(equalTo: agreementSecond.bottomAnchor).isActive = true
        agreementThird.centerXAnchor.constraint(equalTo: agreementView.centerXAnchor).isActive = true
        agreementThird.widthAnchor.constraint(equalToConstant: 250).isActive = true
        agreementThird.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        backButton.topAnchor.constraint(equalTo: agreementThird.bottomAnchor, constant: 20).isActive = true
        backButton.centerXAnchor.constraint(equalTo: agreementView.centerXAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func hideKeyboardTap() {
        ageField.resignFirstResponder()
        genderField.resignFirstResponder()
        phNumberField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    @objc func sendOTPButtonTapped(sender: UIButton) {
        print("Tapped on the send OTP button.")
        let vc = OTPVerifyViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func signInButtonTapped(sender: UIButton) {
        print("Tapped on the sign in button.")
        
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        if let win = window {
            win.rootViewController = UINavigationController(rootViewController: TabBarController())
        } else {
            print("Window not found.")
        }
    }
    
    @objc func backButtonIsTapped(sender: UIButton) {
        print("Tapped on the back button.")
        agreementView.isHidden = true
    }
    
    @objc func tapOnUserAgreements(gesture: UITapGestureRecognizer) {
        if gesture.didTapAttributedTextInLabel(label: agreementLabel, inRange: NSRange(location: 24, length: 20)) {
            print("Tapped Link")
            agreementView.isHidden = false
        }
    }
    
    @objc func dismissAgreementView() {
        agreementView.isHidden = true
    }
    
    
    @objc func tapOnCreateAccButton(sender: UIButton) {
        print("Clicked on the sign up button.")
    }
}
