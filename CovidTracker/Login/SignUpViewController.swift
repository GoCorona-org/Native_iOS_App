//
//  SignUpViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/10.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let logoImage: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        view.image = UIImage(named: "coronalogo")
        view.contentMode = .scaleAspectFit
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
        view.textColor = UIColor(rgb:   0x989898)
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
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.borderStyle = .square
        view.checkmarkStyle = .tick
        view.checkboxFillColor = UIColor(rgb: 0xF6F6F6)
        view.useHapticFeedback = true
        view.uncheckedBorderColor = UIColor(rgb: 0x6B6B6B)
        view.checkedBorderColor = UIColor(red: 231, green: 46, blue: 104)
        view.checkmarkColor = UIColor(red: 231, green: 46, blue: 104)
        view.checkmarkSize = 0.75
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rememberMeLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.text = "Remember me"
        label.font = UIFont(name: "FiraSans-Bold", size: 12)
        label.textColor = UIColor(rgb:  0x989898)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let forgotPwdLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.text = "Forgot password"
        label.font = UIFont(name: "FiraSans-Bold", size: 12)
        label.textColor = UIColor(rgb:  0x989898)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let loginButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
        view.layer.cornerRadius = 10.0
        view.backgroundColor = UIColor(rgb: 0xE03D51)
        view.setTitle("Login", for: .normal)
        view.titleLabel?.font = UIFont(name: "FiraSans-Regular", size: 20.0)
        view.titleLabel?.textAlignment = .center
        view.addTarget(self, action: #selector(loginButtonTapped(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginUsingLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.text = "Or login using"
        label.textAlignment = .center
        label.font = UIFont(name: "FiraSans-Bold", size: 12)
        label.textColor = UIColor(rgb: 0x989898)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fbLogoImage: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.image = UIImage(named: "facebooklogo")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let googleLogoImage: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.image = UIImage(named: "googlelogo")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let linkedInLogoImage: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.image = UIImage(named: "linkedinlogo")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let signupLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.text = "Don’t have an account yet? "
        label.textAlignment = .center
        label.font = UIFont(name: "FiraSans-Regular", size: 12)
        label.textColor = UIColor(rgb: 0x989898)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
        button.setTitle("Signup", for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraSans-ExtraBold", size: 12)
        button.setTitleColor(UIColor(rgb: 0xE03D51), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(signUpButtonTapped(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        addViews()
        placeViews()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTap))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
    }
    
    private func addViews() {
        view.addSubview(logoImage)
        view.addSubview(phNumberField)
        view.addSubview(passwordField)
        view.addSubview(checkbox)
        view.addSubview(rememberMeLabel)
        view.addSubview(forgotPwdLabel)
        view.addSubview(loginButton)
        view.addSubview(loginUsingLabel)
        view.addSubview(fbLogoImage)
        view.addSubview(googleLogoImage)
        view.addSubview(linkedInLogoImage)
        view.addSubview(signupLabel)
        view.addSubview(signupButton)
    }
    
    private func placeViews() {
        
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 70).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        phNumberField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50).isActive = true
        phNumberField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20).isActive = true
        phNumberField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20).isActive = true
        phNumberField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        passwordField.topAnchor.constraint(equalTo: phNumberField.bottomAnchor, constant: 20).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: phNumberField.leadingAnchor).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: phNumberField.trailingAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        checkbox.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        checkbox.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor).isActive  = true
        checkbox.widthAnchor.constraint(equalToConstant: 15).isActive = true
        checkbox.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        rememberMeLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 5).isActive = true
        rememberMeLabel.centerYAnchor.constraint(equalTo: checkbox.centerYAnchor).isActive = true
        rememberMeLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        rememberMeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        forgotPwdLabel.leadingAnchor.constraint(equalTo: rememberMeLabel.trailingAnchor, constant: 90).isActive = true
        forgotPwdLabel.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor).isActive = true
        forgotPwdLabel.centerYAnchor.constraint(equalTo: checkbox.centerYAnchor).isActive = true
        forgotPwdLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        forgotPwdLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: checkbox.bottomAnchor, constant: 30).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        loginUsingLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15).isActive = true
        loginUsingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginUsingLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginUsingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        fbLogoImage.topAnchor.constraint(equalTo: loginUsingLabel.bottomAnchor, constant: 15).isActive = true
        fbLogoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        fbLogoImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        fbLogoImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        googleLogoImage.topAnchor.constraint(equalTo: loginUsingLabel.bottomAnchor, constant: 15).isActive = true
        googleLogoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googleLogoImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        googleLogoImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        linkedInLogoImage.topAnchor.constraint(equalTo: loginUsingLabel.bottomAnchor, constant: 15).isActive = true
        linkedInLogoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        linkedInLogoImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        linkedInLogoImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        signupLabel.topAnchor.constraint(equalTo: linkedInLogoImage.bottomAnchor, constant: 40).isActive = true
        signupLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -25).isActive = true
        signupLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        signupLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        signupButton.topAnchor.constraint(equalTo: linkedInLogoImage.bottomAnchor, constant: 40).isActive = true
        signupButton.centerXAnchor.constraint(equalTo: signupLabel.centerXAnchor, constant: 95).isActive = true
        signupButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    @objc func hideKeyboardTap() {
        phNumberField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    @objc func loginButtonTapped(sender: UIButton){
        print("Tapped on the login button.")
    }
    
    @objc func signUpButtonTapped(sender: UIButton) {
        print("Tapped on the sign up button.")
        let vc = SignUpDetailViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
