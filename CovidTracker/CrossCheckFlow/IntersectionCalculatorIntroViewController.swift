//
//  IntersectionCalculatorIntroViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/19.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class IntersectionCalcutorIntroViewController: CrossCheckViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let introIcon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 210)
        view.image = UIImage(named: "intersectionintroicon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let introDescriptionTextIcon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.image = UIImage(named: "intersectionintrotext")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introductionLabel.text = "Patient"
        backButton.isHidden = false
        nextButton.isHidden = false
    }
    
    override func addIntoBodyView() {
        bodyBaseView.addSubview(introIcon)
        bodyBaseView.addSubview(introDescriptionTextIcon)
    }
    
    override func placeBodyViews() {
        introIcon.centerXAnchor.constraint(equalTo: bodyBaseView.centerXAnchor).isActive = true
        introIcon.topAnchor.constraint(equalTo: bodyBaseView.topAnchor, constant: 30).isActive = true
        introIcon.widthAnchor.constraint(equalToConstant: 220).isActive = true
        introIcon.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        introDescriptionTextIcon.centerXAnchor.constraint(equalTo: bodyBaseView.centerXAnchor).isActive = true
        introDescriptionTextIcon.topAnchor.constraint(equalTo: introIcon.bottomAnchor, constant: 0).isActive = true
        introDescriptionTextIcon.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant:
        40).isActive = true
        introDescriptionTextIcon.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -40).isActive = true
        introDescriptionTextIcon.heightAnchor.constraint(equalToConstant: 330).isActive = true
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        let vc = IntersectionCalculatorTnCViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
