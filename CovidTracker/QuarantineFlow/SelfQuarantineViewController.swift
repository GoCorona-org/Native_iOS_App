//
//  SelfQuarantineViewController.swift
//  CovidTracker
//
//  Created by Tushar Chitnavis on 30/04/20.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import Foundation
import UIKit

class SelfQuarantineViewController: QuarantineViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let selfQuarantineLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 240, height: 25)
        label.text = "If in doubt, self-quarantine"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "FiraSans-ExtraBold", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startDateView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 220, height: 25)
        label.text = "Choose your start date"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "FiraSans-Regular", size: 15)
        view.addSubview(label)
        
        let upperLineView = UIView()
        upperLineView.frame = CGRect(x: 0, y: 28, width: UIScreen.main.bounds.width, height: 2)
        upperLineView.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.addSubview(upperLineView)
        
        let dayButton = UIButton()
        dayButton.frame =  CGRect(x: 30, y: 35, width: 45, height: 35)
        dayButton.backgroundColor = UIColor(rgb: 0xE9E9E9)
        dayButton.titleLabel?.textAlignment = .center
        dayButton.setTitle("DD", for: .normal)
        dayButton.setTitleColor(UIColor(rgb: 0x989898), for: .normal)
        dayButton.titleLabel?.font = UIFont(name: "FiraSans-Bold", size: 15)
        dayButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        dayButton.layer.cornerRadius = 8
        dayButton.layer.borderWidth = 0.3
        dayButton.layer.borderColor = UIColor(rgb: 0x707070).cgColor
        dayButton.addTarget(self, action: #selector(dayButtonPressed(sender:)), for: .touchUpInside)
        dayButton.tag = 1
        view.addSubview(dayButton)
        
        let monthButton = UIButton()
        monthButton.frame =  CGRect(x: 80, y: 35, width: 45, height: 35)
        monthButton.backgroundColor = UIColor(rgb: 0xE9E9E9)
        monthButton.titleLabel?.textAlignment = .center
        monthButton.setTitle("MM", for: .normal)
        monthButton.setTitleColor(UIColor(rgb: 0x989898), for: .normal)
        monthButton.titleLabel?.font = UIFont(name: "FiraSans-Bold", size: 15)
        monthButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        monthButton.layer.cornerRadius = 8
        monthButton.layer.borderWidth = 0.3
        monthButton.layer.borderColor = UIColor(rgb: 0x707070).cgColor
        monthButton.addTarget(self, action: #selector(monthButtonPressed(sender:)), for: .touchUpInside)
        monthButton.tag = 2
        view.addSubview(monthButton)
        
        let bottomLineView = UIView()
        bottomLineView.frame = CGRect(x: 0, y: 75, width: UIScreen.main.bounds.width, height: 2)
        bottomLineView.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.addSubview(bottomLineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let endDateView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 220, height: 25)
        label.text = "Choose your end date"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "FiraSans-Regular", size: 15)
        view.addSubview(label)
        
        let upperLineView = UIView()
        upperLineView.frame = CGRect(x: 0, y: 28, width: UIScreen.main.bounds.width, height: 2)
        upperLineView.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.addSubview(upperLineView)
        
        let dayButton = UIButton()
        dayButton.frame =  CGRect(x: 30, y: 35, width: 45, height: 35)
        dayButton.backgroundColor = UIColor(rgb: 0xE9E9E9)
        dayButton.titleLabel?.textAlignment = .center
        dayButton.setTitle("DD", for: .normal)
        dayButton.setTitleColor(UIColor(rgb: 0x989898), for: .normal)
        dayButton.titleLabel?.font = UIFont(name: "FiraSans-Bold", size: 15)
        dayButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        dayButton.layer.cornerRadius = 8
        dayButton.layer.borderWidth = 0.3
        dayButton.layer.borderColor = UIColor(rgb: 0x707070).cgColor
        dayButton.addTarget(self, action: #selector(dayButtonPressed(sender:)), for: .touchUpInside)
        dayButton.tag = 3
        view.addSubview(dayButton)
        
        let monthButton = UIButton()
        monthButton.frame =  CGRect(x: 80, y: 35, width: 45, height: 35)
        monthButton.backgroundColor = UIColor(rgb: 0xE9E9E9)
        monthButton.titleLabel?.textAlignment = .center
        monthButton.setTitle("MM", for: .normal)
        monthButton.setTitleColor(UIColor(rgb: 0x989898), for: .normal)
        monthButton.titleLabel?.font = UIFont(name: "FiraSans-Bold", size: 15)
        monthButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        monthButton.layer.cornerRadius = 8
        monthButton.layer.borderWidth = 0.3
        monthButton.layer.borderColor = UIColor(rgb: 0x707070).cgColor
        monthButton.addTarget(self, action: #selector(monthButtonPressed(sender:)), for: .touchUpInside)
        monthButton.tag = 4
        view.addSubview(monthButton)
        
        let bottomLineView = UIView()
        bottomLineView.frame = CGRect(x: 0, y: 75, width: UIScreen.main.bounds.width, height: 2)
        bottomLineView.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.addSubview(bottomLineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let updateEdit: UIButton = {
        let button = UIButton()
        button.frame =  CGRect(x: 0, y: 0, width: 128, height: 35)
        button.backgroundColor = UIColor(rgb: 0xA9E7CB)
        button.titleLabel?.textAlignment = .center
        button.setTitle("UPDATE EDIT", for: .normal)
        button.setTitleColor(UIColor(rgb:0x989898), for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraSans-ExtraBold", size: 15)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(updateEditPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollBaseView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        calenderEditButton.isEnabled = false
        calenderEditButton.setImage(UIImage(named: "calendereditselected"), for: .disabled)
        quarantineButton.backgroundColor = UIColor(rgb: 0xC5C5C5)
        shoppingDaysButton.backgroundColor = UIColor(rgb: 0xEEEEEE)
        shoppingListButton.setImage(UIImage(named: "shoppinglist"), for: .normal)
    }
    
    override func addIntoBodyView() {
        
        bodyBaseView.addSubview(selfQuarantineLabel)
        bodyBaseView.addSubview(startDateView)
        bodyBaseView.addSubview(endDateView)
        bodyBaseView.addSubview(updateEdit)
    }
    
    override  func placeCalenderViews() {
              
        selfQuarantineLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30).isActive = true
        selfQuarantineLabel.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 20).isActive = true
        selfQuarantineLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        selfQuarantineLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        startDateView.topAnchor.constraint(equalTo: selfQuarantineLabel.bottomAnchor, constant: 25).isActive = true
        startDateView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        startDateView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        startDateView.heightAnchor.constraint(equalToConstant: 77).isActive = true
        
        endDateView.topAnchor.constraint(equalTo: startDateView.bottomAnchor, constant: 5).isActive = true
        endDateView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        endDateView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        endDateView.heightAnchor.constraint(equalToConstant: 77).isActive = true
        
        updateEdit.topAnchor.constraint(equalTo: endDateView.bottomAnchor, constant: 15).isActive = true
        updateEdit.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 30).isActive = true
        updateEdit.widthAnchor.constraint(equalToConstant: 135).isActive = true
        updateEdit.heightAnchor.constraint(equalToConstant: 36).isActive = true      
    }
    
    @objc func dayButtonPressed(sender: UIButton) {
        openDatePicker(sender: sender)
    }
    
    @objc func monthButtonPressed(sender: UIButton) {
        print("Back button is pressed.")
        openDatePicker(sender: sender)
    }
    
    @objc func updateEditPressed(sender: UIButton) {
        print("Back button is pressed.")
    }
    
}
