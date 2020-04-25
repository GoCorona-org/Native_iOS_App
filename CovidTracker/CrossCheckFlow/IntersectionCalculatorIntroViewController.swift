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
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        var finalHeight: CGFloat = 0.0
        if let size = bodySize  {
            finalHeight = size.height
        } else {
            finalHeight = 550.0
        }
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: finalHeight)
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: finalHeight)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
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
        
        progressView.setProgress(0.5, animated: true)
    }
    
    override func addIntoBodyView() {
        scrollView.addSubview(introIcon)
        scrollView.addSubview(introDescriptionTextIcon)
        
        bodyBaseView.addSubview(scrollView)
    }
    
    override func placeBodyViews() {
        scrollView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: bodyBaseView.heightAnchor).isActive = true
        
        introIcon.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        introIcon.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        introIcon.widthAnchor.constraint(equalToConstant: 220).isActive = true
        introIcon.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        introDescriptionTextIcon.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        introDescriptionTextIcon.topAnchor.constraint(equalTo: introIcon.bottomAnchor, constant: 0).isActive = true
        introDescriptionTextIcon.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (2*40)).isActive = true
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
