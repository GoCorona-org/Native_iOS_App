//
//  CheckupSubmitViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/25.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class CheckupSubmitViewController: CheckupViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let checkupSubmitHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "Thank you"
        view.textAlignment = .left
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Medium", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "For taking time out to provide answers to this survey. Before hitting the submit button, please verify that all responses are answered best to your abilities. Your honest responses are extremely valuable to us as they do not allow us to understand your symptoms and provide you with the next actionable steps but will help us track the spread of COVID-19 in your area."
        view.textAlignment = .left
        view.numberOfLines = 12
        view.lineBreakMode = .byWordWrapping
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.isHidden = false
        nextButton.isHidden = false
        nextButton.setTitle("Submit", for: .normal)
        introductionLabel.text = "Patient"
    }
    
    override func addIntoBodyView() {
        bodyBaseView.addSubview(checkupSubmitHeading)
        bodyBaseView.addSubview(firstSectionHeading)
    }
    
    override func placeBodyViews() {
        checkupSubmitHeading.topAnchor.constraint(equalTo: bodyBaseView.topAnchor, constant: 20).isActive = true
        checkupSubmitHeading.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 20).isActive = true
        checkupSubmitHeading.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -20).isActive = true
        checkupSubmitHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        firstSectionHeading.topAnchor.constraint(equalTo: checkupSubmitHeading.bottomAnchor, constant: 10).isActive = true
        firstSectionHeading.leadingAnchor.constraint(equalTo: checkupSubmitHeading.leadingAnchor).isActive = true
        firstSectionHeading.trailingAnchor.constraint(equalTo: checkupSubmitHeading.trailingAnchor).isActive = true
        firstSectionHeading.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        let uiAlertController = UIAlertController(title: "Submitted", message: "Your questionnaire data has been submitted successfully.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.navigationController?.popToRootViewController(animated: true)
        })
        uiAlertController.addAction(action)
        self.navigationController?.present(uiAlertController, animated: true, completion: nil)
    }
}
