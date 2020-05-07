//
//  SignUpViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/10.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit
import FirebaseAuth
import FacebookLogin
import FBSDKLoginKit
import FacebookCore
import GoogleSignIn

class SignUpViewController: UIViewController, GIDSignInDelegate, UITextFieldDelegate {
    
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
        view.tag = 1
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
        view.tag = 2
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
    
    let fbLogoImage: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.setImage(UIImage(named: "facebooklogo"), for: .normal)
        view.addTarget(self, action: #selector(fbSignInButtonTapped(sender:)), for: .touchUpInside)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let googleLogoImage: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.setImage(UIImage(named: "googlelogo"), for: .normal)
        view.addTarget(self, action: #selector(googleSignInButtonTapped(sender:)), for: .touchUpInside)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let linkedInLogoImage: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.setImage(UIImage(named: "linkedinlogo"), for: .normal)
        view.addTarget(self, action: #selector(linkedInSignInButtonTapped(sender:)), for: .touchUpInside)
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
        
        phNumberField.delegate = self
        passwordField.delegate = self
        
        addViews()
        placeViews()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        if let token = AccessToken.current,
            !token.isExpired {
            // User is logged in, do work such as go to next view controller.
        }
        
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
        
        forgotPwdLabel.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor).isActive = true
        forgotPwdLabel.centerYAnchor.constraint(equalTo: checkbox.centerYAnchor).isActive = true
        forgotPwdLabel.widthAnchor.constraint(equalToConstant: 95).isActive = true
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
    
    
    //MARK:- PHONE NUMBER LOGIN
    @objc func loginButtonTapped(sender: UIButton){
        print("Tapped on the login button.")
        //change email address to phone number
        Auth.auth().signIn(withEmail: (phNumberField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""), password: (passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")) { (result, error) in
            if let _eror = error{
                print(_eror.localizedDescription)
            }else{
                if let _res = result{
                    print(_res)
                    self.loginSuccessful()
                }
            }
        }
    }
    
    
    //MARK:- FACEBOOK LOGIN METHOD
    @objc func fbSignInButtonTapped(sender: UIButton){
        print("Tapped on the Facebook login button.")
        getFacebookUserInfo()
    }
    
    func getFacebookUserInfo(){
        let loginManager = LoginManager()
        //        https://developers.facebook.com/docs/facebook-login/permissions
        loginManager.logIn(permissions: ["public_profile", "email"], viewController: self) { (result) in
            switch result{
            case .cancelled:
                print("Cancel button click")
            case .success:
                let facebookCredential:AuthCredential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                self.loginFireBaseWithCredential(credential: facebookCredential)
            default:
                print("??")
            }
        }
    }
    
    
    //MARK:- GOOGLE SIGN IN DELEGATE
    @objc func googleSignInButtonTapped(sender: UIButton){
        print("Tapped on the Google login button.")
        GIDSignIn.sharedInstance().delegate=self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
    }
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                     withError error: Error!) {
        if (error == nil) {
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            self.loginFireBaseWithCredential(credential: credential)
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    //MARK:- FIREBASE AUTHENTICATION
    func loginFireBaseWithCredential(credential:AuthCredential){
        Auth.auth().signIn(with: credential) {(result, error) in
            if error != nil {
                print("\(credential) Authentification Fail")
            } else {
                //firebase user loggedin successfully through google.
                if let user = result?.user{
                    print(user.email as Any)
                    print(user.displayName as Any)
                    self.loginSuccessful()
                }
            }
        }
    }
    
    //MARK:- LINKEDIN AUTHENTICATION    
    @objc func linkedInSignInButtonTapped(sender: UIButton){
        print("Tapped on the LinkedIn login button.")
        linkedInAuthVC()
    }
    
    var webView = WKWebView()
    func linkedInAuthVC() {
        // Create linkedIn Auth ViewController
        let linkedInVC = UIViewController()
        // Create WebView
        let webView = WKWebView()
        webView.navigationDelegate = self
        linkedInVC.view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: linkedInVC.view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: linkedInVC.view.leadingAnchor),
            webView.bottomAnchor.constraint(equalTo: linkedInVC.view.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: linkedInVC.view.trailingAnchor)
        ])
        
        let state = "linkedin\(Int(NSDate().timeIntervalSince1970))"
        
        let authURLFull = LinkedInConstants.AUTHURL + "?response_type=code&client_id=" + LinkedInConstants.CLIENT_ID + "&scope=" + LinkedInConstants.SCOPE + "&state=" + state + "&redirect_uri=" + LinkedInConstants.REDIRECT_URI
        
        
        let urlRequest = URLRequest.init(url: URL.init(string: authURLFull)!)
        webView.load(urlRequest)
        
        // Create Navigation Controller
        let navController = UINavigationController(rootViewController: linkedInVC)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelAction))
        linkedInVC.navigationItem.leftBarButtonItem = cancelButton
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshAction))
        linkedInVC.navigationItem.rightBarButtonItem = refreshButton
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navController.navigationBar.titleTextAttributes = textAttributes
        linkedInVC.navigationItem.title = "linkedin.com"
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.tintColor = UIColor.white
        navController.navigationBar.barTintColor = UIColor.black
        navController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        navController.modalTransitionStyle = .coverVertical
        
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc func cancelAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func refreshAction() {
        self.webView.reload()
    }
    
    @objc func signUpButtonTapped(sender: UIButton) {
        print("Tapped on the sign up button.")
        let vc = SignUpDetailViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- LOGIN SUCCESSFULL
    func loginSuccessful() {
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Phone Number" || textField.text == "Password" {
            textField.text = ""
            textField.textColor = .black
            textField.font = UIFont(name: "FiraSans-Regular", size: 15)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if textField.text!.isEmpty{
            if textField.tag == 1 {
                textField.text = "Phone Number"
            }
            else if textField.tag == 2{
                textField.text = "Password"
            }
            else{
            }
            textField.textColor = UIColor(rgb:  0x989898)
        }
    }    
}
