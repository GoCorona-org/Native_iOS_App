//
//  PatientPhysicalInfomationViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/12.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class PatientPhysicalInformationViewController: CheckupViewController {
    
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
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = .clear
        return view
    }()
    
    let ageQuestionLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "How old are you?"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "HelveticaNeue", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ageLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        view.text = "0"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "HelveticaNeue", size: 24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ageSlider: UISlider = {
        let view = UISlider()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 10)
        view.tintColor = UIColor(rgb: 0x49D581)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setThumbImage(UIImage(named: "sliderthumb"), for: .normal)
        view.addTarget(self, action: #selector(ageSliderIsMoved(slider:)), for: .valueChanged)
        return view
    }()
    
    let heightQuestionLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "What is your height?"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "HelveticaNeue", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let heightLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        view.text = "150 cm"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "HelveticaNeue", size: 24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let heightSlider: UISlider = {
        let view = UISlider()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 10)
        view.tintColor = UIColor(rgb: 0x49D581)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setThumbImage(UIImage(named: "sliderthumb"), for: .normal)
        view.addTarget(self, action: #selector(heightSliderIsMoved(slider:)), for: .valueChanged)
        return view
    }()
    
    let weightQuestionLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "What is your weight?"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "HelveticaNeue", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let weightLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        view.text = "60 Kg"
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "HelveticaNeue", size: 24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let weightSlider: UISlider = {
        let view = UISlider()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 10)
        view.tintColor = UIColor(rgb: 0x49D581)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setThumbImage(UIImage(named: "sliderthumb"), for: .normal)
        view.addTarget(self, action: #selector(weightSliderIsMoved(slider:)), for: .valueChanged)
        return view
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        backButton.isHidden = false
        nextButton.isHidden = false
        introductionLabel.text = "Patient"
        
    }
    
    override func addIntoBodyView() {
        
        scrollView.addSubview(ageQuestionLabel)
        scrollView.addSubview(ageLabel)
        scrollView.addSubview(ageSlider)
        
        scrollView.addSubview(heightQuestionLabel)
        scrollView.addSubview(heightLabel)
        scrollView.addSubview(heightSlider)
        heightSlider.transform = CGAffineTransform(rotationAngle: -.pi/2)
        
        scrollView.addSubview(weightQuestionLabel)
        scrollView.addSubview(weightLabel)
        scrollView.addSubview(weightSlider)
        
        bodyBaseView.addSubview(scrollView)
    }
    
    override func placeBodyViews() {
        
        scrollView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        
        ageQuestionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        ageQuestionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        ageQuestionLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        ageQuestionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        ageLabel.topAnchor.constraint(equalTo: ageQuestionLabel.bottomAnchor, constant: 0).isActive = true
        ageLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        ageLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ageLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        ageSlider.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10).isActive = true
        ageSlider.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        ageSlider.widthAnchor.constraint(equalToConstant: 300).isActive = true
        ageSlider.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        heightQuestionLabel.topAnchor.constraint(equalTo: ageSlider.topAnchor, constant: 60).isActive = true
        heightQuestionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        heightQuestionLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        heightQuestionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        heightLabel.topAnchor.constraint(equalTo: heightQuestionLabel.bottomAnchor, constant: 0).isActive = true
        heightLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        heightLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        heightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        heightSlider.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 150).isActive = true
        heightSlider.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        heightSlider.widthAnchor.constraint(equalToConstant: 280).isActive = true
        heightSlider.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        weightQuestionLabel.topAnchor.constraint(equalTo: heightSlider.topAnchor, constant: 180).isActive = true
        weightQuestionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        weightQuestionLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        weightQuestionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        weightLabel.topAnchor.constraint(equalTo: weightQuestionLabel.bottomAnchor, constant: 0).isActive = true
        weightLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        weightLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        weightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        weightSlider.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10).isActive = true
        weightSlider.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        weightSlider.widthAnchor.constraint(equalToConstant: 300).isActive = true
        weightSlider.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        print("Patient physical info back button is tapped.")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        print("Patient physical info next button is tapped.")
        let nextVC = PatientSymptomCheckViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func ageSliderIsMoved(slider: UISlider) {
        ageLabel.text = String(Int(slider.value * 100))
    }
    
    @objc func heightSliderIsMoved(slider: UISlider) {
        heightLabel.text = String(Int(slider.value * 100 + 100)) + " cm"
    }
    
    @objc func weightSliderIsMoved(slider: UISlider) {
        weightLabel.text =  String(Int(slider.value * 100)) + " Kg"
    }
}
