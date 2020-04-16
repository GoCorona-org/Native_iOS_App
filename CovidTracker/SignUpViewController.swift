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
        view.image = UIImage(named: "LogoOnly")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headingfirst: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 70)
        view.text = "SPOT"
        view.font = UIFont(name: "HelveticaNeue", size: 40.0)
        view.textAlignment = .center
        view.textColor = UIColor(red: 231, green: 46, blue: 104)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headingsecond: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        view.text = "C O R O N A"
        view.font = UIFont(name: "HelveticaNeue", size: 18)
        view.textAlignment = .center
        view.textColor = UIColor(red: 231, green: 51, blue: 106)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headingthird: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        view.text = "LIVE"
        view.font = UIFont(name: "HelveticaNeue", size: 42.0)
        view.textAlignment = .center
        view.textColor = UIColor(red: 127, green: 127, blue: 127)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let signUpButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
        view.layer.cornerRadius = 10.0
        view.backgroundColor = UIColor(red: 231, green: 46, blue: 104)
        view.setTitle("SIGN UP", for: .normal)
        view.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20.0)
        view.titleLabel?.textAlignment = .center
        view.addTarget(self, action: #selector(signUpButtonTapped(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        addViews()
        placeViews()
    }
    
    private func addViews() {
        view.addSubview(logoImage)
        view.addSubview(headingfirst)
        view.addSubview(headingsecond)
        view.addSubview(headingthird)
        view.addSubview(signUpButton)
    }
    
    private func placeViews() {
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        headingfirst.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10).isActive = true
        headingfirst.centerXAnchor.constraint(equalTo: logoImage.centerXAnchor).isActive = true
        headingfirst.widthAnchor.constraint(equalToConstant: 150).isActive = true
        headingfirst.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        headingsecond.topAnchor.constraint(equalTo: headingfirst.bottomAnchor).isActive = true
        headingsecond.centerXAnchor.constraint(equalTo: headingfirst.centerXAnchor).isActive = true
        headingsecond.widthAnchor.constraint(equalToConstant: 150).isActive = true
        headingsecond.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        headingthird.topAnchor.constraint(equalTo: headingsecond.bottomAnchor).isActive = true
        headingthird.centerXAnchor.constraint(equalTo: headingsecond.centerXAnchor).isActive = true
        headingthird.widthAnchor.constraint(equalToConstant: 150).isActive = true
        headingthird.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signUpButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -150).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func signUpButtonTapped(sender: UIButton) {
        print("Tapped on the sign up button.")
        let vc = SignUpDetailViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
