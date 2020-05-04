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
    
    var tempEndDate = Date()
    var tempStartDate = Date()
    var tempDateAdded = Date()
    
    let selfQuarantineLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 240, height: 25)
        label.text = "If in doubt, self-quarantine"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "FiraSans-ExtraBold", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startDateView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 0, width: 220, height: 25)
        label.text = "Choose your start date"
        label.textAlignment = .left
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
        label.frame = CGRect(x: 30, y: 0, width: 220, height: 25)
        label.text = "Choose your end date"
        label.textAlignment = .left
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
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(updateEditPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
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
    
    let selfQurantineView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let shoppingListLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 25)
        label.text = "Build your shopping list and pin it"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "FiraSans-ExtraBold", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shoppingDate1View: UIView = {
        let view = UIView()
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 0, width: 250, height: 25)
        label.text = "Choose your shopping date"
        label.textAlignment = .left
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
        label.frame = CGRect(x: 30, y: 0, width: 220, height: 25)
        label.text = "Choose your shopping date"
        label.textAlignment = .left
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
        label.frame = CGRect(x: 30, y: 0, width: 220, height: 25)
        label.text = "Choose your shopping date"
        label.textAlignment = .left
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
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.isHidden = true
        calenderEditButton.isEnabled = false
        quarantineButton.isEnabled = false
        shoppingDaysButton.isEnabled = true
        shoppingListButton.isEnabled = true
        
        calenderEditButton.setImage(UIImage(named: "calendereditselected"), for: .disabled)
        quarantineButton.backgroundColor = UIColor(rgb: 0xC5C5C5)
        shoppingDaysButton.backgroundColor = UIColor(rgb: 0xEEEEEE)
        shoppingListButton.setImage(UIImage(named: "shoppinglist"), for: .normal)
    }
    
    override func addIntoBodyView() {
        
        selfQurantineView.addSubview(selfQuarantineLabel)
        selfQurantineView.addSubview(startDateView)
        selfQurantineView.addSubview(endDateView)
        selfQurantineView.addSubview(updateEdit)
        bodyBaseView.addSubview(selfQurantineView)
        
        shoppingDaysScrollBaseView.addSubview(shoppingListLabel)
        shoppingDaysScrollBaseView.addSubview(shoppingDate1View)
        shoppingDaysScrollBaseView.addSubview(shoppingDate2View)
        shoppingDaysScrollBaseView.addSubview(shoppingDate3View)
        shoppingDaysScrollBaseView.addSubview(delete1Button)
        shoppingDaysScrollBaseView.addSubview(delete2Button)
        shoppingDaysScrollBaseView.addSubview(addButton)
        bodyBaseView.addSubview(shoppingDaysScrollBaseView)
        
        shoppingDaysScrollBaseView.isHidden = true
        selfQurantineView.isHidden = false
    }
    
    override  func placeCalenderViews() {
        
        selfQurantineView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        selfQurantineView.bottomAnchor.constraint(equalTo: bodyBaseView.bottomAnchor).isActive = true
        selfQurantineView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        selfQurantineView.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor).isActive = true
        selfQurantineView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        
        selfQuarantineLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30).isActive = true
        selfQuarantineLabel.leadingAnchor.constraint(equalTo: selfQurantineView.leadingAnchor, constant: 30).isActive = true
        selfQuarantineLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        selfQuarantineLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        startDateView.topAnchor.constraint(equalTo: selfQuarantineLabel.bottomAnchor, constant: 25).isActive = true
        startDateView.leadingAnchor.constraint(equalTo: selfQurantineView.leadingAnchor).isActive = true
        startDateView.widthAnchor.constraint(equalTo: selfQurantineView.widthAnchor).isActive = true
        startDateView.heightAnchor.constraint(equalToConstant: 77).isActive = true
        
        endDateView.topAnchor.constraint(equalTo: startDateView.bottomAnchor, constant: 5).isActive = true
        endDateView.leadingAnchor.constraint(equalTo: selfQurantineView.leadingAnchor).isActive = true
        endDateView.widthAnchor.constraint(equalTo: selfQurantineView.widthAnchor).isActive = true
        endDateView.heightAnchor.constraint(equalToConstant: 77).isActive = true
        
        updateEdit.topAnchor.constraint(equalTo: endDateView.bottomAnchor, constant: 15).isActive = true
        updateEdit.leadingAnchor.constraint(equalTo: selfQurantineView.leadingAnchor, constant: 30).isActive = true
        updateEdit.widthAnchor.constraint(equalToConstant: 135).isActive = true
        updateEdit.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        shoppingDaysScrollBaseView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        shoppingDaysScrollBaseView.bottomAnchor.constraint(equalTo: bodyBaseView.bottomAnchor).isActive = true
        shoppingDaysScrollBaseView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        shoppingDaysScrollBaseView.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor).isActive = true
        shoppingDaysScrollBaseView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        
        shoppingListLabel.topAnchor.constraint(equalTo: shoppingDaysScrollBaseView.topAnchor, constant: 30).isActive = true
        shoppingListLabel.leadingAnchor.constraint(equalTo: shoppingDaysScrollBaseView.leadingAnchor, constant: 30).isActive = true
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
    
    override func quarantinePressed(sender: UIButton) {
        print("Quarantine pressed.")
        qurantineSeleted()
    }
    
    func qurantineSeleted() {
        selfQurantineView.isHidden = false
        shoppingDaysScrollBaseView.isHidden = true
        
        quarantineButton.isEnabled = false
        calenderEditButton.isEnabled = false
        shoppingDaysButton.isEnabled = true
        shoppingListButton.isEnabled = true
        
        calenderEditButton.setImage(UIImage(named: "calendereditselected"), for: .disabled)
        quarantineButton.backgroundColor = UIColor(rgb: 0xC5C5C5)
        shoppingDaysButton.backgroundColor = UIColor(rgb: 0xEEEEEE)
        shoppingListButton.setImage(UIImage(named: "shoppinglist"), for: .normal)
    }
    
    override func shoppingDaysPressed(sender: UIButton) {
        print("Shopping days pressed.")
        shoppingDaysSeleted()
    }
    
    func shoppingDaysSeleted() {
        selfQurantineView.isHidden = true
        shoppingDaysScrollBaseView.isHidden = false
        quarantineButton.isEnabled = true
        calenderEditButton.isEnabled = false
        shoppingDaysButton.isEnabled = false
        shoppingListButton.isEnabled = true
        calenderEditButton.setImage(UIImage(named: "calendereditselected"), for: .disabled)
        shoppingDaysButton.backgroundColor = UIColor(rgb: 0xC5C5C5)
        quarantineButton.backgroundColor = UIColor(rgb: 0xEEEEEE)
        shoppingListButton.setImage(UIImage(named: "shoppinglist"), for: .normal)
    }
    
    override func shoppingListPressed(sender: UIButton) {
        print("Shopping list pressed.")
        quarantineButton.isEnabled = true
        calenderEditButton.isEnabled = false
        shoppingDaysButton.isEnabled = true
        shoppingListButton.isEnabled = false
        quarantineButton.backgroundColor = UIColor(rgb: 0xEEEEEE)
        shoppingDaysButton.backgroundColor = UIColor(rgb: 0xEEEEEE)
        shoppingListButton.setImage(UIImage(named: "shoppinglistselected"), for: .disabled)
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
        UserDefaults.standard.set(startDate, forKey: "StartDate")
        UserDefaults.standard.set(endDate, forKey: "EndDate")
    }
    
    override func doneButtonIsTapped(sender: UIButton) {
        print("Next button is pressed.")
        if endDate > startDate {
            let qurantineVC = QuarantineViewController()
            self.navigationController?.pushViewController(qurantineVC, animated: false)
        }
        else{
            alertPopUp(errorMessage: "Please fill all fields")
        }
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        print("Back button is pressed.")
        if endDate > startDate{
            self.navigationController?.popViewController(animated: true)
        }
        else{
            alertPopUp(errorMessage: "Please fill all fields")
        }
    }
    
    
    @objc func deleteButtonEditPressed(sender: UIButton) {
        print("Back button is pressed.")
    }
    
    @objc func addButtonPressed(sender: UIButton) {
        print("Back button is pressed.")
        shoppingDateAdded = tempDateAdded
        UserDefaults.standard.set(shoppingDateAdded, forKey: "ShoppingDateAdded")
    }
    
    func openDatePicker(sender: UIButton) {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.month = +3
        let threeMonth = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        datePicker.show("Select Date",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: currentDate,
                        maximumDate: threeMonth,
                        datePickerMode: .date) { (date) in
                            if let dt = date {
                                let formatterDay = DateFormatter()
                                let formatterMonth = DateFormatter()
                                formatterDay.dateFormat = "dd"
                                formatterMonth.dateFormat = "MM"
                                if sender.tag == 1{
                                    self.tempStartDate = dt
                                    if self.firstTimeDateSeleted {
                                        if let button = self.view.viewWithTag(4) as? UIButton, let validValue = button.titleLabel?.text {
                                            if let _ = Int(validValue){
                                                self.firstTimeDateSeleted = false
                                            }
                                            else{
                                            }
                                        }
                                        sender.setTitle(formatterDay.string(from: dt), for: .normal)
                                        
                                        if let button = self.view.viewWithTag(2) as? UIButton
                                        {
                                            button.setTitle(formatterMonth.string(from: dt), for: .normal)
                                        }
                                        self.startDate = self.tempStartDate
                                    }
                                    else{
                                        self.startDayValidation(day: sender)
                                    }
                                }
                                else if sender.tag == 2{
                                    self.tempStartDate = dt
                                    if self.firstTimeDateSeleted {
                                        if let button = self.view.viewWithTag(4) as? UIButton, let validValue = button.titleLabel?.text {
                                            if let _ = Int(validValue){
                                                self.firstTimeDateSeleted = false
                                            }
                                            else{
                                            }
                                        }
                                        
                                        sender.setTitle(formatterMonth.string(from: dt), for: .normal)
                                        if let button = self.view.viewWithTag(1) as? UIButton
                                        {
                                            button.setTitle(formatterDay.string(from: dt), for: .normal)
                                        }
                                        self.startDate = self.tempStartDate
                                    }
                                    else{
                                        self.startMonthValidation(month: sender)
                                    }
                                }
                                else if sender.tag == 3{
                                    self.tempEndDate = dt
                                    if self.firstTimeDateSeleted {
                                        if let button = self.view.viewWithTag(2) as? UIButton, let validValue = button.titleLabel?.text {
                                            if let _ = Int(validValue){
                                                self.firstTimeDateSeleted = false
                                            }
                                            else{
                                            }
                                        }
                                        sender.setTitle(formatterDay.string(from: dt), for: .normal)
                                        if let button = self.view.viewWithTag(4) as? UIButton
                                        {
                                            button.setTitle(formatterMonth.string(from: dt), for: .normal)
                                        }
                                        self.endDate = self.tempEndDate
                                    }
                                    else{
                                        self.endDayValidation(day: sender)
                                    }
                                }
                                else if sender.tag == 4{
                                    self.tempEndDate = dt
                                    if self.firstTimeDateSeleted {
                                        if let button = self.view.viewWithTag(2) as? UIButton, let validValue = button.titleLabel?.text {
                                            if let _ = Int(validValue){
                                                self.firstTimeDateSeleted = false
                                            }
                                            else{
                                            }
                                        }
                                        sender.setTitle(formatterMonth.string(from: dt), for: .normal)
                                        if let button = self.view.viewWithTag(3) as? UIButton
                                        {
                                            button.setTitle(formatterDay.string(from: dt), for: .normal)
                                        }
                                        self.endDate = self.tempEndDate
                                    }
                                    else{
                                        self.endtMonthValidation(month: sender)
                                    }
                                }
                                else if sender.tag == 5{
                                    self.tempDateAdded = dt
                                    sender.setTitle(formatterDay.string(from: dt), for: .normal)
                                    if let button = self.view.viewWithTag(6) as? UIButton
                                    {
                                        button.setTitle(formatterMonth.string(from: dt), for: .normal)
                                    }
                                }
                                else{
                                    self.tempDateAdded = dt
                                    sender.setTitle(formatterMonth.string(from: dt), for: .normal)
                                    if let button = self.view.viewWithTag(5) as? UIButton
                                    {
                                        button.setTitle(formatterDay.string(from: dt), for: .normal)
                                    }
                                }
                            }
        }
    }
    
    let datePicker = DatePickerDialog(
        textColor: .black,
        buttonColor: .black,
        font: UIFont.boldSystemFont(ofSize: 17),
        showCancelButton: true
    )
    
    func startDayValidation(day: UIButton) {
        let formatterDay = DateFormatter()
        let formatterMonth = DateFormatter()
        formatterDay.dateFormat = "dd"
        formatterMonth.dateFormat = "MM"
        if endDate > tempStartDate{
            startDate = tempStartDate
            day.setTitle(formatterDay.string(from: startDate), for: .normal)
            if let button = self.view.viewWithTag(2) as? UIButton
            {
                button.setTitle(formatterMonth.string(from: startDate), for: .normal)
            }
        }
        else{
            alertPopUp(errorMessage: "Start date should be less than end date")
        }
    }
    
    func startMonthValidation(month: UIButton) {
        
        let formatterDay = DateFormatter()
        let formatterMonth = DateFormatter()
        formatterDay.dateFormat = "dd"
        formatterMonth.dateFormat = "MM"
        if endDate > tempStartDate{
            startDate = tempStartDate
            month.setTitle(formatterMonth.string(from: startDate), for: .normal)
            if let button = self.view.viewWithTag(1) as? UIButton
            {
                button.setTitle(formatterDay.string(from: startDate), for: .normal)
            }
        }
        else{
            alertPopUp(errorMessage: "Start date should be less than end date")
        }
    }
    
    func endDayValidation(day: UIButton) {
        
        let formatterDay = DateFormatter()
        let formatterMonth = DateFormatter()
        formatterDay.dateFormat = "dd"
        formatterMonth.dateFormat = "MM"
        if tempEndDate > startDate{
            endDate = tempEndDate
            day.setTitle(formatterDay.string(from: endDate), for: .normal)
            if let button = self.view.viewWithTag(4) as? UIButton
            {
                button.setTitle(formatterMonth.string(from: endDate), for: .normal)
            }
        }
        else{
            alertPopUp(errorMessage: "End date should be greater than start date")
        }
    }
    
    func endtMonthValidation(month: UIButton) {
        let formatterDay = DateFormatter()
        let formatterMonth = DateFormatter()
        formatterDay.dateFormat = "dd"
        formatterMonth.dateFormat = "MM"
        
        if tempEndDate > startDate{
            endDate = tempEndDate
            month.setTitle(formatterMonth.string(from: endDate), for: .normal)
            if let button = self.view.viewWithTag(3) as? UIButton
            {
                button.setTitle(formatterDay.string(from: endDate), for: .normal)
            }
        }
        else{
            alertPopUp(errorMessage: "End date should be greater than start date")
        }
    }
    
    func alertPopUp(errorMessage: String) {
    let alert = UIAlertController(title: "ERROR", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}
