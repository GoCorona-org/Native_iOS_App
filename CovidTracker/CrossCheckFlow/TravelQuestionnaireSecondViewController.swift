//
//  TravelQuestionnaireSecondViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/21.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class TravelQuestionnaireSecondViewController: CrossCheckViewController, UITextFieldDelegate {
    
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
        view.text = "What about domestic travel?"
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
        view.image = UIImage(named: "domestictravelicon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Have you travelled anywhere inside India by flight in the last 30 days?"
        view.textAlignment = .left
        view.backgroundColor = .systemBackground
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
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
    
    let firstTableCellId = "domesticTravelCellID"
    
    let secondSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "If yes, then select the airports you were at"
        view.textAlignment = .left
        view.backgroundColor = .systemBackground
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textColor = UIColor.label
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fromField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 30)
        view.layer.cornerRadius = 5.0
        view.attributedPlaceholder = NSAttributedString(string: "From", attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x989898)])
        view.autocorrectionType = .yes
        view.backgroundColor = UIColor(rgb: 0xE9E9E9)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let toField: UITextField = {
        let view = UITextField()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 30)
        view.layer.cornerRadius = 5.0
        view.attributedPlaceholder = NSAttributedString(string: "To", attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x989898)])
        view.autocorrectionType = .yes
        view.backgroundColor = UIColor(rgb: 0xE9E9E9)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introductionLabel.text = "Travel"
        backButton.isHidden = false
        nextButton.isHidden = false
        
        firstSectionTableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: firstTableCellId)
        firstSectionTableView.delegate = self
        firstSectionTableView.dataSource = self
        
        progressView.setProgress(0.75, animated: true)
        fromField.delegate = self
        toField.delegate = self
    }
    
    override func addIntoBodyView() {
        scrollView.addSubview(travelQuestionnaireHeading)
        scrollView.addSubview(pageicon)
        scrollView.addSubview(firstSectionHeading)
        scrollView.addSubview(firstSectionTableView)
        
        scrollView.addSubview(secondSectionHeading)
        scrollView.addSubview(fromField)
        scrollView.addSubview(toField)
        
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
        
        firstSectionTableView.topAnchor.constraint(equalTo: firstSectionHeading.bottomAnchor).isActive = true
        firstSectionTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        firstSectionTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        firstSectionTableView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        secondSectionHeading.topAnchor.constraint(equalTo: firstSectionTableView.bottomAnchor, constant: 20).isActive = true
        secondSectionHeading.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor).isActive = true
        secondSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        secondSectionHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fromField.topAnchor.constraint(equalTo: secondSectionHeading.bottomAnchor, constant: 10).isActive = true
        fromField.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor, constant: 10).isActive = true
        fromField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (2*60)).isActive = true
        fromField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        toField.topAnchor.constraint(equalTo: fromField.bottomAnchor, constant: 10).isActive = true
        toField.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor, constant: 10).isActive = true
        toField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (2*60)).isActive = true
        toField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        print("Next button is tapped.")
        let vc = TravelQuestionnaireSubmitViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension TravelQuestionnaireSecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: firstTableCellId, for: indexPath) as? OptionsTableViewCell {
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
    }
}
