//
//  PatientSCTwoViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/16.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class PatientSCTwoViewController: CheckupViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        var finalHeight: CGFloat = 0.0
        if let size = bodySize  {
            finalHeight = size.height
        } else {
            finalHeight = 700.0
        }
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: finalHeight)
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: finalHeight + 300)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let symptomCheckHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "Please tell us about your symptoms"
        view.textAlignment = .left
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Medium", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pageicon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 230)
        view.image = UIImage(named: "patientsctwocheck")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Do you have fever?"
        view.textAlignment = .left
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSectionTableView: UITableView = {
        let view = UITableView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        view.tag = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstTableCellId = "feverCellID"
    
    let secondSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Can you describe your fever?"
        view.textAlignment = .left
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondSectionTableView: UITableView = {
        let view = UITableView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        view.tag = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondTableCellId = "feverDescriptionCellID"
    
    let feverDescriptions = ["Fever that comes and goes", "Fever that is consistent"]
    
    let thirdSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Have you measured your temperature?"
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .left
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thirdSectionTableView: UITableView = {
        let view = UITableView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        view.tag = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thirdTableCellId = "feverMeasurementCellID"
    
    let fourthSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "What's the temperature of your fever?"
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .left
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever1LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.layer.cornerRadius = 8.0
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        view.tag = 1
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever2LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 2
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever3LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 3
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever4LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 4
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever5LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 5
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever6LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 6
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever7LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 7
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever8LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 8
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever9LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.tag = 9
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fever10LevelButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.layer.cornerRadius = 8.0
        view.layer.maskedCorners = [.layerMaxXMinYCorner]
        view.tag = 10
        view.addTarget(self, action: #selector(feverButtonIsPressed(sender:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let extensionLeftView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1, height: 5)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let extensionRightView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1, height: 5)
        view.backgroundColor = UIColor(rgb: 0xE4E4E4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var feverButtons: [UIButton:UIColor] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.isHidden = false
        nextButton.isHidden = false
        introductionLabel.text = "Patient"
        
        firstSectionTableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: firstTableCellId)
        firstSectionTableView.delegate = self
        firstSectionTableView.dataSource = self
        
        secondSectionTableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: secondTableCellId)
        secondSectionTableView.delegate = self
        secondSectionTableView.dataSource = self
        
        thirdSectionTableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: thirdTableCellId)
        thirdSectionTableView.delegate = self
        thirdSectionTableView.dataSource = self
    }
    
    override func addIntoBodyView() {
        scrollView.addSubview(symptomCheckHeading)
        scrollView.addSubview(pageicon)
        
        scrollView.addSubview(firstSectionHeading)
        scrollView.addSubview(firstSectionTableView)
        
        scrollView.addSubview(secondSectionHeading)
        scrollView.addSubview(secondSectionTableView)
        
        scrollView.addSubview(thirdSectionHeading)
        scrollView.addSubview(thirdSectionTableView)
        
        scrollView.addSubview(fourthSectionHeading)
        scrollView.addSubview(fever1LevelButton)
        scrollView.addSubview(fever2LevelButton)
        scrollView.addSubview(fever3LevelButton)
        scrollView.addSubview(fever4LevelButton)
        scrollView.addSubview(fever5LevelButton)
        scrollView.addSubview(fever6LevelButton)
        scrollView.addSubview(fever7LevelButton)
        scrollView.addSubview(fever8LevelButton)
        scrollView.addSubview(fever9LevelButton)
        scrollView.addSubview(fever10LevelButton)
        scrollView.addSubview(extensionLeftView)
        scrollView.addSubview(extensionRightView)
        
        feverButtons = [fever1LevelButton: UIColor(rgb: 0xE9E963), fever2LevelButton: UIColor(rgb: 0xE7Da64), fever3LevelButton: UIColor(rgb: 0xE4CC65), fever4LevelButton: UIColor(rgb: 0xE1BB66), fever5LevelButton: UIColor(rgb: 0xDFAE68), fever6LevelButton: UIColor(rgb: 0xDC9e68), fever7LevelButton: UIColor(rgb: 0xD6806B), fever8LevelButton: UIColor(rgb: 0xD67065), fever9LevelButton: UIColor(rgb: 0xD85450), fever10LevelButton: UIColor(rgb: 0xE0433F)]
        
        bodyBaseView.addSubview(scrollView)
    }
    
    override func placeBodyViews() {
        let feverButtonWidth = (UIScreen.main.bounds.width - (35*2) - (2*9)) / 10
        
        scrollView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: bodyBaseView.heightAnchor).isActive = true
        
        
        symptomCheckHeading.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        symptomCheckHeading.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30).isActive = true
        symptomCheckHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        symptomCheckHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        pageicon.topAnchor.constraint(equalTo: symptomCheckHeading.bottomAnchor, constant: 20).isActive = true
        pageicon.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        pageicon.widthAnchor.constraint(equalToConstant: 220).isActive = true
        pageicon.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        firstSectionHeading.topAnchor.constraint(equalTo: pageicon.bottomAnchor, constant: 20).isActive = true
        firstSectionHeading.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        firstSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        firstSectionHeading.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        firstSectionTableView.topAnchor.constraint(equalTo: firstSectionHeading.bottomAnchor).isActive = true
        firstSectionTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        firstSectionTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        firstSectionTableView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        secondSectionHeading.topAnchor.constraint(equalTo: firstSectionTableView.bottomAnchor, constant: 20).isActive = true
        secondSectionHeading.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        secondSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        secondSectionHeading.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        secondSectionTableView.topAnchor.constraint(equalTo: secondSectionHeading.bottomAnchor).isActive = true
        secondSectionTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        secondSectionTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        secondSectionTableView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        thirdSectionHeading.topAnchor.constraint(equalTo: secondSectionTableView.bottomAnchor, constant: 20).isActive = true
        thirdSectionHeading.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        thirdSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        thirdSectionHeading.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        thirdSectionTableView.topAnchor.constraint(equalTo: thirdSectionHeading.bottomAnchor).isActive = true
        thirdSectionTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        thirdSectionTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        thirdSectionTableView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        fourthSectionHeading.topAnchor.constraint(equalTo: thirdSectionTableView.bottomAnchor, constant: 20).isActive = true
        fourthSectionHeading.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        fourthSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        fourthSectionHeading.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        fever1LevelButton.topAnchor.constraint(equalTo: fourthSectionHeading.bottomAnchor, constant: 10).isActive = true
        fever1LevelButton.leadingAnchor.constraint(equalTo: symptomCheckHeading.leadingAnchor).isActive = true
        fever1LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever1LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever2LevelButton.topAnchor.constraint(equalTo: fever1LevelButton.topAnchor).isActive = true
        fever2LevelButton.leadingAnchor.constraint(equalTo: fever1LevelButton.trailingAnchor, constant: 2).isActive = true
        fever2LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever2LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever3LevelButton.topAnchor.constraint(equalTo: fever1LevelButton.topAnchor).isActive = true
        fever3LevelButton.leadingAnchor.constraint(equalTo: fever2LevelButton.trailingAnchor, constant: 2).isActive = true
        fever3LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever3LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever4LevelButton.topAnchor.constraint(equalTo: fever1LevelButton.topAnchor).isActive = true
        fever4LevelButton.leadingAnchor.constraint(equalTo: fever3LevelButton.trailingAnchor, constant: 2).isActive = true
        fever4LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever4LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever5LevelButton.topAnchor.constraint(equalTo: fever1LevelButton.topAnchor).isActive = true
        fever5LevelButton.leadingAnchor.constraint(equalTo: fever4LevelButton.trailingAnchor, constant: 2).isActive = true
        fever5LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever5LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever6LevelButton.topAnchor.constraint(equalTo: fever1LevelButton.topAnchor).isActive = true
        fever6LevelButton.leadingAnchor.constraint(equalTo: fever5LevelButton.trailingAnchor, constant: 2).isActive = true
        fever6LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever6LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever7LevelButton.topAnchor.constraint(equalTo: fever1LevelButton.topAnchor).isActive = true
        fever7LevelButton.leadingAnchor.constraint(equalTo: fever6LevelButton.trailingAnchor, constant: 2).isActive = true
        fever7LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever7LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever8LevelButton.topAnchor.constraint(equalTo: fever1LevelButton.topAnchor).isActive = true
        fever8LevelButton.leadingAnchor.constraint(equalTo: fever7LevelButton.trailingAnchor, constant: 2).isActive = true
        fever8LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever8LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever9LevelButton.topAnchor.constraint(equalTo: fever1LevelButton.topAnchor).isActive = true
        fever9LevelButton.leadingAnchor.constraint(equalTo: fever8LevelButton.trailingAnchor, constant: 2).isActive = true
        fever9LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever9LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fever10LevelButton.topAnchor.constraint(equalTo: fever1LevelButton.topAnchor).isActive = true
        fever10LevelButton.leadingAnchor.constraint(equalTo: fever9LevelButton.trailingAnchor, constant: 2).isActive = true
        fever10LevelButton.widthAnchor.constraint(equalToConstant: feverButtonWidth).isActive = true
        fever10LevelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        extensionLeftView.topAnchor.constraint(equalTo: fever1LevelButton.bottomAnchor).isActive = true
        extensionLeftView.leadingAnchor.constraint(equalTo: fever1LevelButton.leadingAnchor).isActive = true
        extensionLeftView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        extensionLeftView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        extensionRightView.topAnchor.constraint(equalTo: fever10LevelButton.bottomAnchor).isActive = true
        extensionRightView.trailingAnchor.constraint(equalTo: fever10LevelButton.trailingAnchor).isActive = true
        extensionRightView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        extensionRightView.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    @objc func feverButtonIsPressed(sender: UIButton) {
        print("Fever button is pressed for the level \(sender.tag)")
        feverButtons.forEach({$0.key.backgroundColor = UIColor(rgb: 0xE4E4E4)})
        for (button, color) in feverButtons {
            if button.tag <= sender.tag {
                button.backgroundColor = color
            }
        }
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        print("Next button is tapped for PatientSCTwoVC.")
        let vc = PatientSCThreeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension PatientSCTwoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return options.count
        } else if tableView.tag == 1 {
            return feverDescriptions.count
        } else if tableView.tag == 2 {
            return options.count
        } else {
            return options.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0, let cell = tableView.dequeueReusableCell(withIdentifier: firstTableCellId, for: indexPath) as? OptionsTableViewCell {
            cell.textLabel?.text = options[indexPath.item]
            return cell
        } else if tableView.tag == 1, let cell = tableView.dequeueReusableCell(withIdentifier: secondTableCellId, for: indexPath) as? OptionsTableViewCell {
            cell.textLabel?.text = feverDescriptions[indexPath.item]
            return cell
        } else if tableView.tag == 2, let cell = tableView.dequeueReusableCell(withIdentifier: thirdTableCellId, for: indexPath) as? OptionsTableViewCell {
            cell.textLabel?.text = options[indexPath.item]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 0 {
            if options[indexPath.item] == "Yes" {
                medicalData.fever = Int.random(in: 1...4)
            } else {
                medicalData.fever = 0
            }
            print(medicalData.fever ?? 10)
        }
    }
}
