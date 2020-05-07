//
//  OTPVerifyViewiController.swift
//  CovidTracker
//
//  Created by Tushar Chitnavis on 05/05/20.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import Foundation
import UIKit

class OTPVerifyViewController: UIViewController, UITextFieldDelegate {
    
    var otpResendTimer = 120
    var timerTest : Timer?
    
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
    
    let firstDigitTextField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        view.backgroundColor = UIColor(rgb: 0xF4F4F4)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 8
        view.textAlignment = .center
        view.font = UIFont(name: "FiraSans-Regular", size: 25)
        view.keyboardType = .numberPad
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondDigitTextField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        view.backgroundColor = UIColor(rgb: 0xF4F4F4)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 8
        view.textAlignment = .center
        view.font = UIFont(name: "FiraSans-Regular", size: 25)
        view.keyboardType = .numberPad
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thirdDigitTextField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        view.backgroundColor = UIColor(rgb: 0xF4F4F4)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 8
        view.textAlignment = .center
        view.font = UIFont(name: "FiraSans-Regular", size: 25)
        view.keyboardType = .numberPad
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fourthDigitTextField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        view.backgroundColor = UIColor(rgb: 0xF4F4F4)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 8
        view.textAlignment = .center
        view.font = UIFont(name: "FiraSans-Regular", size: 25)
        view.keyboardType = .numberPad
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fifthDigitTextField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        view.backgroundColor = UIColor(rgb: 0xF4F4F4)
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 8
        view.textAlignment = .center
        view.font = UIFont(name: "FiraSans-Regular", size: 25)
        view.keyboardType = .numberPad
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let checkOTPLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.text = "Please check your text messages for the code"
        label.font = UIFont(name: "FiraSans-Regular", size: 13)
        label.textColor = UIColor(rgb:  0x989898)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let autoResendOTPLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        let mut1 = NSMutableAttributedString(string: "OTP auto resend in       ", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "FiraSans-Regular", size: 13) ?? UIFont.systemFont(ofSize: 13.0), NSMutableAttributedString.Key.foregroundColor: UIColor(rgb:  0x989898)])
        let mut2 = NSMutableAttributedString(string: "seconds", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "FiraSans-Bold", size: 13) ?? UIFont.systemFont(ofSize: 13.0), NSMutableAttributedString.Key.foregroundColor: UIColor(rgb: 0xE03D51)])
        mut1.append(mut2)
        label.attributedText = mut1
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let autoResendTimerLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.font = UIFont(name: "FiraSans-Bold", size: 13)
        label.textColor = UIColor(rgb: 0xE03D51)
        label.textAlignment = .center
        label.text = "120"
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let verifyOTPButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        view.setTitle("Verify OTP", for: .normal)
        view.layer.cornerRadius = view.frame.height/2.2
        view.backgroundColor = UIColor(rgb: 0xE03D51)
        view.titleLabel?.font = UIFont(name: "FiraSans-Regular", size: 20.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(verifyOTPButtonTapped(sender:)), for: .touchUpInside)
        return view
    }()
    
    let resendOTPButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
        button.setTitle("Resend OTP", for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraSans-Bold", size: 13)
        button.setTitleColor(UIColor(rgb: 0xE03D51), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(resendOTPButtonTapped(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        timerTest = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        firstDigitTextField.delegate = self
        secondDigitTextField.delegate = self
        thirdDigitTextField.delegate = self
        fourthDigitTextField.delegate = self
        fifthDigitTextField.delegate = self
        
        firstDigitTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        secondDigitTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        thirdDigitTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        fourthDigitTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        fifthDigitTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        
        firstDigitTextField.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
        secondDigitTextField.addTarget(self, action: #selector(textFieldDidBeginEditing), for:.editingDidBegin)
        thirdDigitTextField.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
        fourthDigitTextField.addTarget(self, action: #selector(textFieldDidBeginEditing), for:.editingDidBegin)
        fifthDigitTextField.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
        
        addViews()
        placeViews()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTap))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
    }
    
    private func addViews() {
        view.addSubview(logoImage)
        view.addSubview(firstDigitTextField)
        view.addSubview(secondDigitTextField)
        view.addSubview(thirdDigitTextField)
        view.addSubview(fourthDigitTextField)
        view.addSubview(fifthDigitTextField)
        view.addSubview(checkOTPLabel)
        view.addSubview(autoResendOTPLabel)
        view.addSubview(autoResendTimerLabel)
        view.addSubview(verifyOTPButton)
        view.addSubview(resendOTPButton)
    }
    
    private func placeViews() {
        
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 70).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        firstDigitTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 70).isActive = true
        firstDigitTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -110).isActive = true
        firstDigitTextField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        firstDigitTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        secondDigitTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 70).isActive = true
        secondDigitTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -55).isActive = true
        secondDigitTextField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        secondDigitTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        thirdDigitTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 70).isActive = true
        thirdDigitTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdDigitTextField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        thirdDigitTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        fourthDigitTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 70).isActive = true
        fourthDigitTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 55).isActive = true
        fourthDigitTextField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        fourthDigitTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        fifthDigitTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 70).isActive = true
        fifthDigitTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 110).isActive = true
        fifthDigitTextField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        fifthDigitTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        checkOTPLabel.topAnchor.constraint(equalTo: fifthDigitTextField.bottomAnchor, constant: 10).isActive = true
        checkOTPLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkOTPLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        checkOTPLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        autoResendOTPLabel.topAnchor.constraint(equalTo: checkOTPLabel.bottomAnchor, constant: 30).isActive = true
        autoResendOTPLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        autoResendOTPLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        autoResendOTPLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        autoResendTimerLabel.topAnchor.constraint(equalTo: checkOTPLabel.bottomAnchor, constant: 30).isActive = true
        autoResendTimerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 31).isActive = true
        autoResendTimerLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
        autoResendTimerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        verifyOTPButton.topAnchor.constraint(equalTo: autoResendOTPLabel.bottomAnchor, constant: 30).isActive = true
        verifyOTPButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        verifyOTPButton.widthAnchor.constraint(equalToConstant: 210).isActive = true
        verifyOTPButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        resendOTPButton.topAnchor.constraint(equalTo: verifyOTPButton.bottomAnchor, constant: 40).isActive = true
        resendOTPButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resendOTPButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        resendOTPButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    @objc func updateCounter() {
        if(otpResendTimer > 0) {
            autoResendTimerLabel.text = String("\(otpResendTimer - 1)")
            otpResendTimer -= 1
        }
        else{
            alertPopUp(errorMessage: "Please click on Verify OTP or Resend OTP")
            resendOTPButton.isEnabled = true
            otpResendTimer = 120
            timerTest?.invalidate()
            timerTest = nil
        }
    }
    
    @objc func hideKeyboardTap() {
        firstDigitTextField.resignFirstResponder()
        secondDigitTextField.resignFirstResponder()
        thirdDigitTextField.resignFirstResponder()
        fourthDigitTextField.resignFirstResponder()
        fifthDigitTextField.resignFirstResponder()
    }
    
    @objc func verifyOTPButtonTapped(sender: UIButton){
        print("Tapped on verify OTP button.")
        
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
    
    @objc func resendOTPButtonTapped(sender: UIButton) {
        print("Tapped on resend OTP button.")
        timerTest = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        resendOTPButton.isEnabled = false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        switch textField{
        case firstDigitTextField:
            secondDigitTextField.becomeFirstResponder()
        case secondDigitTextField:
            thirdDigitTextField.becomeFirstResponder()
        case thirdDigitTextField:
            fourthDigitTextField.becomeFirstResponder()
        case fourthDigitTextField:
            fifthDigitTextField.becomeFirstResponder()
            break
        default:
            break
        }
    }
    
    @objc private func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    func alertPopUp(errorMessage: String) {
        let alert = UIAlertController(title: "ERROR", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
