//
//  ShoppingDaysViewController.swift
//  CovidTracker
//
//  Created by Tushar Chitnavis on 01/05/20.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import Foundation
import UIKit

class ShoppingDaysViewController: QuarantineViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let shoppingDaysScrollBaseView: UIScrollView = {
        let view = UIScrollView()
        var finalHeight: CGFloat = 0.0
        if let size = bodySize  {
            finalHeight = size.height
        } else {
            finalHeight = 550
        }
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: finalHeight)
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: finalHeight + 300)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let shoppingListLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 25)
        label.text = "Build your shopping list and pin it"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "FiraSans-ExtraBold", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shoppingDate1View: UIView = {
        let view = UIView()
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 220, height: 25)
        label.text = "Choose your shopping date"
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
    
    let shoppingDate2View: UIView = {
        let view = UIView()
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 220, height: 25)
        label.text = "Choose your shopping date"
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
    
    let shoppingDate3View: UIView = {
        let view = UIView()
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 220, height: 25)
        label.text = "Choose your shopping date"
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
        dayButton.tag = 5
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
        monthButton.tag = 6
        view.addSubview(monthButton)
        
        let bottomLineView = UIView()
        bottomLineView.frame = CGRect(x: 0, y: 75, width: UIScreen.main.bounds.width, height: 2)
        bottomLineView.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.addSubview(bottomLineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let delete1Button: UIButton = {
        let button = UIButton()
        button.frame =  CGRect(x: 0, y: 0, width: 128, height: 35)
        button.backgroundColor = UIColor(rgb: 0xFFB8C4)
        button.titleLabel?.textAlignment = .center
        button.setTitle("DELETE", for: .normal)
        button.setTitleColor(UIColor(rgb:0x989898), for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraSans-ExtraBold", size: 15)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteButtonEditPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    let delete2Button: UIButton = {
        let button = UIButton()
        button.frame =  CGRect(x: 0, y: 0, width: 128, height: 35)
        button.backgroundColor = UIColor(rgb: 0xFFB8C4)
        button.titleLabel?.textAlignment = .center
        button.setTitle("DELETE", for: .normal)
        button.setTitleColor(UIColor(rgb:0x989898), for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraSans-ExtraBold", size: 15)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteButtonEditPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.frame =  CGRect(x: 0, y: 0, width: 128, height: 35)
        button.backgroundColor = UIColor(rgb: 0xA9E7CB)
        button.titleLabel?.textAlignment = .center
        button.setTitle("ADD", for: .normal)
        button.setTitleColor(UIColor(rgb:0x989898), for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraSans-ExtraBold", size: 15)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollBaseView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        calenderEditButton.isEnabled = false
        calenderEditButton.setImage(UIImage(named: "calendereditselected"), for: .disabled)
        shoppingDaysButton.backgroundColor = UIColor(rgb: 0xC5C5C5)
        quarantineButton.backgroundColor = UIColor(rgb: 0xEEEEEE)
        shoppingListButton.setImage(UIImage(named: "shoppinglist"), for: .normal)
    }
    
    override func addIntoBodyView() {
        
        shoppingDaysScrollBaseView.addSubview(shoppingListLabel)
        shoppingDaysScrollBaseView.addSubview(shoppingDate1View)
        shoppingDaysScrollBaseView.addSubview(shoppingDate2View)
        shoppingDaysScrollBaseView.addSubview(shoppingDate3View)
        shoppingDaysScrollBaseView.addSubview(delete1Button)
        shoppingDaysScrollBaseView.addSubview(delete2Button)
        shoppingDaysScrollBaseView.addSubview(addButton)
        bodyBaseView.addSubview(shoppingDaysScrollBaseView)
    }
    
    override func placeCalenderViews() {
        
        shoppingDaysScrollBaseView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        shoppingDaysScrollBaseView.bottomAnchor.constraint(equalTo: bodyBaseView.bottomAnchor).isActive = true
        shoppingDaysScrollBaseView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        shoppingDaysScrollBaseView.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor).isActive = true
        shoppingDaysScrollBaseView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        
        shoppingListLabel.topAnchor.constraint(equalTo: shoppingDaysScrollBaseView.topAnchor, constant: 30).isActive = true
        shoppingListLabel.leadingAnchor.constraint(equalTo: shoppingDaysScrollBaseView.leadingAnchor, constant: 20).isActive = true
        shoppingListLabel.widthAnchor.constraint(equalToConstant: 280).isActive = true
        shoppingListLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        shoppingDate1View.topAnchor.constraint(equalTo: shoppingListLabel.bottomAnchor, constant: 25).isActive = true
        shoppingDate1View.leadingAnchor.constraint(equalTo: shoppingDaysScrollBaseView.leadingAnchor).isActive = true
        shoppingDate1View.widthAnchor.constraint(equalTo: shoppingDaysScrollBaseView.widthAnchor).isActive = true
        shoppingDate1View.heightAnchor.constraint(equalToConstant: 77).isActive = true
        
        delete1Button.topAnchor.constraint(equalTo: shoppingDate1View.bottomAnchor, constant: 15).isActive = true
        delete1Button.leadingAnchor.constraint(equalTo: shoppingDaysScrollBaseView.leadingAnchor, constant: 30).isActive = true
        delete1Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        delete1Button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        shoppingDate2View.topAnchor.constraint(equalTo: delete1Button.bottomAnchor, constant: 5).isActive = true
        shoppingDate2View.leadingAnchor.constraint(equalTo: shoppingDaysScrollBaseView.leadingAnchor).isActive = true
        shoppingDate2View.widthAnchor.constraint(equalTo: shoppingDaysScrollBaseView.widthAnchor).isActive = true
        shoppingDate2View.heightAnchor.constraint(equalToConstant: 77).isActive = true
        
        delete2Button.topAnchor.constraint(equalTo: shoppingDate2View.bottomAnchor, constant: 15).isActive = true
        delete2Button.leadingAnchor.constraint(equalTo: shoppingDaysScrollBaseView.leadingAnchor, constant: 30).isActive = true
        delete2Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        delete2Button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        shoppingDate3View.topAnchor.constraint(equalTo: delete2Button.bottomAnchor, constant: 5).isActive = true
        shoppingDate3View.leadingAnchor.constraint(equalTo: shoppingDaysScrollBaseView.leadingAnchor).isActive = true
        shoppingDate3View.widthAnchor.constraint(equalTo: shoppingDaysScrollBaseView.widthAnchor).isActive = true
        shoppingDate3View.heightAnchor.constraint(equalToConstant: 77).isActive = true
        
        addButton.topAnchor.constraint(equalTo: shoppingDate3View.bottomAnchor, constant: 15).isActive = true
        addButton.leadingAnchor.constraint(equalTo: shoppingDaysScrollBaseView.leadingAnchor, constant: 30).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    @objc func dayButtonPressed(sender: UIButton) {
        openDatePicker(sender: sender)
    }
    
    @objc func monthButtonPressed(sender: UIButton) {
        print("Back button is pressed.")
        openDatePicker(sender: sender)
    }
    
    @objc func deleteButtonEditPressed(sender: UIButton) {
        print("Back button is pressed.")
    }
    
    @objc func addButtonPressed(sender: UIButton) {
        print("Back button is pressed.")
    }
}
