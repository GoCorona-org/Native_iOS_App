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
    
    let nameField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.layer.cornerRadius = 5.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        view.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        view.autocorrectionType = .no
        view.backgroundColor = UIColor(red: 239, green: 239, blue: 239)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ageField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.layer.cornerRadius = 5.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        view.attributedPlaceholder = NSAttributedString(string: "Age", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        view.autocorrectionType = .no
        view.backgroundColor = UIColor(red: 239, green: 239, blue: 239)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.keyboardType = .numberPad
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let genderField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.layer.cornerRadius = 5.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        view.attributedPlaceholder = NSAttributedString(string: "Gender", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        view.autocorrectionType = .yes
        view.backgroundColor = UIColor(red: 239, green: 239, blue: 239)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.layer.cornerRadius = 5.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        view.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        view.autocorrectionType = .yes
        view.backgroundColor = UIColor(red: 239, green: 239, blue: 239)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.keyboardType = .emailAddress
        view.autocorrectionType = .no
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let phNumberField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.layer.cornerRadius = 5.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        view.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        view.autocorrectionType = .no
        view.backgroundColor = UIColor(red: 239, green: 239, blue: 239)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.keyboardType = .numberPad
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50)
        view.layer.cornerRadius = 5.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        view.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        view.autocorrectionType = .yes
        view.backgroundColor = UIColor(red: 239, green: 239, blue: 239)
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
        let mut1 = NSMutableAttributedString(string: "I've read and agreed to ", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0), NSMutableAttributedString.Key.foregroundColor: UIColor(red: 153, green: 153, blue: 153)])
        let mut2 = NSMutableAttributedString(string: "Terms and Conditions", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0), NSMutableAttributedString.Key.foregroundColor: UIColor(red: 59, green: 36, blue: 178)])
        mut1.append(mut2)
        label.attributedText = mut1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        return label
    }()
    
    let createAccButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        view.setTitle("CREATE ACCOUNT", for: .normal)
        view.layer.cornerRadius = view.frame.height / 2
        view.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 231, green: 46, blue: 104)
        view.addTarget(self, action: #selector(tapOnCreateAccButton(sender:)), for: .touchUpInside)
        return view
    }()
    
    let accExists: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 220, height: 30)
        let mut1 = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0), NSMutableAttributedString.Key.foregroundColor: UIColor(red: 153, green: 153, blue: 153)])
        let mut2 = NSMutableAttributedString(string: "Sign in", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0), NSMutableAttributedString.Key.foregroundColor: UIColor(red: 59, green: 36, blue: 178)])
        mut1.append(mut2)
        label.attributedText = mut1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        return label
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
        view.font = UIFont(name: "HelveticaNeue", size: 18.0)
        view.textColor = UIColor(red: 59, green: 36, blue: 178)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let agreementFirst: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 120)
        view.text = "The app has been built only to access your location to analyse, predict and contain the spread of coronoa virus."
        view.font = UIFont(name: "HelveticaNeue", size: 18.0)
        view.textColor = UIColor(red: 153, green: 153, blue: 153)
        view.textAlignment = .left
        view.numberOfLines = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let agreementSecond: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 120)
        view.text = "Your information will not be used for any other purpose without a prior notification and approval from your end."
        view.font = UIFont(name: "HelveticaNeue", size: 18.0)
        view.textColor = UIColor(red: 153, green: 153, blue: 153)
        view.textAlignment = .left
        view.numberOfLines = 4
        view.translatesAutoresizingMaskIntoConstraints = false
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
        
        let signInTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnAccExists(gesture:)))
        signInTapGesture.numberOfTapsRequired = 1
        accExists.addGestureRecognizer(signInTapGesture)
        
        let dismissAgreementTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissAgreementView))
        dismissAgreementTapGesture.numberOfTapsRequired = 1
        agreementView.addGestureRecognizer(dismissAgreementTapGesture)
    }
    
    private func addViews() {
        view.addSubview(nameField)
        view.addSubview(ageField)
        view.addSubview(genderField)
        view.addSubview(emailField)
        view.addSubview(phNumberField)
        view.addSubview(passwordField)
        view.addSubview(checkbox)
        view.addSubview(agreementLabel)
        view.addSubview(createAccButton)
        view.addSubview(accExists)
        
        agreementView.addSubview(agreementHeader)
        agreementView.addSubview(agreementFirst)
        agreementView.addSubview(agreementSecond)
        view.addSubview(agreementView)
    }
    
    private func placeViews() {
        nameField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50).isActive = true
        nameField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20).isActive = true
        nameField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        ageField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20).isActive = true
        ageField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor).isActive = true
        ageField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor).isActive = true
        ageField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        genderField.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 20).isActive = true
        genderField.leadingAnchor.constraint(equalTo: ageField.leadingAnchor).isActive = true
        genderField.trailingAnchor.constraint(equalTo: ageField.trailingAnchor).isActive = true
        genderField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailField.topAnchor.constraint(equalTo: genderField.bottomAnchor, constant: 20).isActive = true
        emailField.leadingAnchor.constraint(equalTo: genderField.leadingAnchor).isActive = true
        emailField.trailingAnchor.constraint(equalTo: genderField.trailingAnchor).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        phNumberField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20).isActive = true
        phNumberField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor).isActive = true
        phNumberField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor).isActive = true
        phNumberField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordField.topAnchor.constraint(equalTo: phNumberField.bottomAnchor, constant: 20).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: phNumberField.leadingAnchor).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: phNumberField.trailingAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        checkbox.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        checkbox.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor, constant: 5).isActive  = true
        checkbox.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkbox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        agreementLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 10).isActive = true
        agreementLabel.centerYAnchor.constraint(equalTo: checkbox.centerYAnchor).isActive = true
        agreementLabel.widthAnchor.constraint(equalToConstant: 290).isActive = true
        agreementLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        createAccButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -100).isActive = true
        createAccButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createAccButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        createAccButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        accExists.topAnchor.constraint(equalTo: createAccButton.bottomAnchor, constant: 20).isActive = true
        accExists.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        accExists.widthAnchor.constraint(equalToConstant: 220).isActive = true
        accExists.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        agreementHeader.topAnchor.constraint(equalTo: agreementView.topAnchor, constant: 150).isActive = true
        agreementHeader.centerXAnchor.constraint(equalTo: agreementView.centerXAnchor).isActive = true
        agreementHeader.widthAnchor.constraint(equalToConstant: 200).isActive = true
        agreementHeader.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        agreementFirst.topAnchor.constraint(equalTo: agreementHeader.bottomAnchor, constant: 10).isActive = true
        agreementFirst.centerXAnchor.constraint(equalTo: agreementView.centerXAnchor).isActive = true
        agreementFirst.widthAnchor.constraint(equalToConstant: 250).isActive = true
        agreementFirst.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        agreementSecond.topAnchor.constraint(equalTo: agreementFirst.bottomAnchor, constant: 10).isActive = true
        agreementSecond.centerXAnchor.constraint(equalTo: agreementView.centerXAnchor).isActive = true
        agreementSecond.widthAnchor.constraint(equalToConstant: 250).isActive = true
        agreementSecond.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func hideKeyboardTap() {
        nameField.resignFirstResponder()
        ageField.resignFirstResponder()
        genderField.resignFirstResponder()
        emailField.resignFirstResponder()
        phNumberField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    @objc func tapOnUserAgreements(gesture: UITapGestureRecognizer) {
        if gesture.didTapAttributedTextInLabel(label: agreementLabel, inRange: NSRange(location: 24, length: 20)) {
            print("Tapped Link")
            agreementView.isHidden = false
        }
    }
    
    @objc  func tapOnAccExists(gesture: UITapGestureRecognizer) {
        if gesture.didTapAttributedTextInLabel(label: accExists, inRange: NSRange(location: 25, length: 7)) {
            print("Tapped Sign in Link")
        }
    }
    
    @objc func dismissAgreementView() {
        agreementView.isHidden = true
    }
    
    
    @objc func tapOnCreateAccButton(sender: UIButton) {
        print("Clicked on the sign up button.")
        
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
}
