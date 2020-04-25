//
//  TravelQuestionnaireSubmitViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/25.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class TravelQuestionnaireSubmitViewController: CrossCheckViewController, UITextFieldDelegate {
    
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
    
    let travelQuestionnaireHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "Stranded due to the lockdown?"
        view.textAlignment = .left
        view.numberOfLines = 2
        view.lineBreakMode =  .byWordWrapping
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Medium", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pageicon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 230)
        view.image = UIImage(named: "lockdownicon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Which city are you from and where are you staying now?"
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .left
        view.backgroundColor = .systemBackground
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let hometownField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 30)
        view.layer.cornerRadius = 5.0
        view.attributedPlaceholder = NSAttributedString(string: "Hometown", attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x989898)])
        view.autocorrectionType = .yes
        view.backgroundColor = UIColor(rgb: 0xE9E9E9)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let currentLocationField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 30)
        view.layer.cornerRadius = 5.0
        view.attributedPlaceholder = NSAttributedString(string: "Current Location", attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x989898)])
        view.autocorrectionType = .yes
        view.backgroundColor = UIColor(rgb: 0xE9E9E9)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "What modes of transport have you used for commute in the last 30 days?"
        view.textAlignment = .left
        view.backgroundColor = .systemBackground
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textColor = UIColor.label
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondSectionTableView: UITableView = {
        let view = UITableView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        view.allowsMultipleSelection = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondTableCellId = "travelOptionsCellID"
    
    let travelOptions = ["Local train or bus", "Auto rickshaw or cab", "Personal Vehicle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introductionLabel.text = "Lockdown"
        backButton.isHidden = false
        nextButton.isHidden = false
        nextButton.setTitle("Submit", for: .normal)
        
        secondSectionTableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: secondTableCellId)
        secondSectionTableView.delegate = self
        secondSectionTableView.dataSource = self
        
        progressView.setProgress(1.0, animated: true)
        hometownField.delegate = self
        currentLocationField.delegate = self
    }
    
    override func addIntoBodyView() {
        scrollView.addSubview(travelQuestionnaireHeading)
        scrollView.addSubview(pageicon)
        scrollView.addSubview(firstSectionHeading)
        scrollView.addSubview(hometownField)
        scrollView.addSubview(currentLocationField)
        
        scrollView.addSubview(secondSectionHeading)
        scrollView.addSubview(secondSectionTableView)
        
        bodyBaseView.addSubview(scrollView)
    }
    
    override func placeBodyViews() {
        scrollView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: bodyBaseView.heightAnchor).isActive = true
        
        travelQuestionnaireHeading.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        travelQuestionnaireHeading.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        travelQuestionnaireHeading.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (2*20)).isActive = true
        travelQuestionnaireHeading.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        pageicon.topAnchor.constraint(equalTo: travelQuestionnaireHeading.bottomAnchor, constant: 10).isActive = true
        pageicon.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        pageicon.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (2*35)).isActive = true
        pageicon.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        firstSectionHeading.topAnchor.constraint(equalTo: pageicon.bottomAnchor, constant: 20).isActive = true
        firstSectionHeading.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor).isActive = true
        firstSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        firstSectionHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        hometownField.topAnchor.constraint(equalTo: firstSectionHeading.bottomAnchor, constant: 10).isActive = true
        hometownField.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor, constant: 10).isActive = true
        hometownField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (2*60)).isActive = true
        hometownField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        currentLocationField.topAnchor.constraint(equalTo: hometownField.bottomAnchor, constant: 10).isActive = true
        currentLocationField.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor, constant: 10).isActive = true
        currentLocationField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (2*60)).isActive = true
        currentLocationField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        secondSectionHeading.topAnchor.constraint(equalTo: currentLocationField.bottomAnchor, constant: 20).isActive = true
        secondSectionHeading.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor).isActive = true
        secondSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        secondSectionHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        secondSectionTableView.topAnchor.constraint(equalTo: secondSectionHeading.bottomAnchor).isActive = true
        secondSectionTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        secondSectionTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        secondSectionTableView.heightAnchor.constraint(equalToConstant: 105).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        print("Submit button is tapped.")
        let uiAlertController = UIAlertController(title: "Submitted", message: "Your travel questionnaire data has been submitted successfully.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.navigationController?.popToRootViewController(animated: true)
        })
        uiAlertController.addAction(action)
        self.navigationController?.present(uiAlertController, animated: true, completion: nil)
    }
}
extension TravelQuestionnaireSubmitViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: secondTableCellId, for: indexPath) as? OptionsTableViewCell {
            cell.textLabel?.text = travelOptions[indexPath.item]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///print(healthHistorySymptoms[indexPath.item])
    }
}
