//
//  MedicalScoreViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/29.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class MedicalScoreViewController: CrossCheckViewController {
    
    let bgView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let bgImageView: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let maskIcon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.image = UIImage(named: "coronaresulticon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backgroundIcon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.image = UIImage(named: "coronaresulticon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scoreLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        view.font = UIFont(name: "FiraSans-Regular", size: 26.0)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var score: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introductionLabel.text = "Result"
        nextButton.isHidden = false
        nextButton.setTitle("Exit", for: .normal)
        
        scoreLabel.text = String(Int(score)) + "% probability"
        
        progressView.setProgress(1.0, animated: false)
    }
    
    override func addIntoBodyView() {
        bgView.addSubview(createScoreView(score: score, color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)))
        bgImageView.image = bgView.asImage()
        bgImageView.mask = maskIcon
        bodyBaseView.addSubview(backgroundIcon)
        bodyBaseView.addSubview(bgImageView)
        bodyBaseView.addSubview(scoreLabel)
    }
    
    override func placeBodyViews() {
        
        bgImageView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor, constant: 40).isActive = true
        bgImageView.centerXAnchor.constraint(equalTo: bodyBaseView.centerXAnchor).isActive = true
        bgImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        bgImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        backgroundIcon.centerXAnchor.constraint(equalTo: bgImageView.centerXAnchor).isActive = true
        backgroundIcon.centerYAnchor.constraint(equalTo: bgImageView.centerYAnchor).isActive = true
        backgroundIcon.widthAnchor.constraint(equalTo: bgImageView.widthAnchor).isActive = true
        backgroundIcon.heightAnchor.constraint(equalTo: bgImageView.heightAnchor).isActive = true
        
        scoreLabel.topAnchor.constraint(equalTo: bgImageView.bottomAnchor, constant: 20).isActive = true
        scoreLabel.centerXAnchor.constraint(equalTo: bgImageView.centerXAnchor).isActive = true
        scoreLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        scoreLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
        if let tabBarController = self.presentingViewController as? UITabBarController {
            tabBarController.selectedIndex = 1
        } else {
            print("Tab bar not found.")
        }
    }
    
    private func createScoreView(score: CGFloat, color: UIColor) -> UIView {
        let colorView = UIView()
        let coord = (score * 300) / 100
        colorView.frame = CGRect(x: 0, y: 300 - coord, width: 300, height: coord)
        colorView.backgroundColor = color
        return colorView
    }
}
extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
