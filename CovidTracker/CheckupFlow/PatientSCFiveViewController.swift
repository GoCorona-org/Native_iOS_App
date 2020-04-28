//
//  PatientSCFiveViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/16.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class PatientSCFiveViewController: CheckupViewController {
    
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
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: finalHeight + 200)
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
        view.image = UIImage(named: "patientscfivecheck")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Do you have sore throat?"
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
    
    let firstTableCellId = "throatCellID"
    
    let secondSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Do you have nasal congestion?"
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
    
    let secondTableCellId = "nasalCellID"
    
    let thirdSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Have you lost a sense of taste or smell?"
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
    
    let thirdTableCellId = "tasteCellID"
    
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
        
        bodyBaseView.addSubview(scrollView)
    }
    
    override func placeBodyViews() {
        
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
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        print("Next button is tapped in PatientSCThreeVC.")
        let vc = PatientSCSixViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension PatientSCFiveViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0, let cell = tableView.dequeueReusableCell(withIdentifier: firstTableCellId, for: indexPath) as? OptionsTableViewCell {
            cell.textLabel?.text = options[indexPath.item]
            return cell
        } else if tableView.tag == 1, let cell = tableView.dequeueReusableCell(withIdentifier: secondTableCellId, for: indexPath) as? OptionsTableViewCell {
            cell.textLabel?.text = options[indexPath.item]
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
                medicalData.soreThroat = true
            } else {
                medicalData.soreThroat = false
            }
        } else if tableView.tag == 1 {
            if options[indexPath.item] == "Yes" {
                medicalData.nasalCongestion = true
            } else {
                medicalData.nasalCongestion = false
            }
        } else if tableView.tag == 2 {
            if options[indexPath.item] == "Yes" {
                medicalData.lossOfTasteAndSmell = true
            } else {
                medicalData.lossOfTasteAndSmell = false
            }
        }
    }
}
