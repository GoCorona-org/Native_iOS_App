//
//  QuarantineViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/11.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class QuarantineViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        
        let navView = createNavView()
        if let menuButton = navView.subviews.first(where: {$0 is UIButton}) as? UIButton {
            menuButton.addTarget(self, action: #selector(sideMenuPressed(sender:)), for: .touchUpInside)
        }
        view.addSubview(navView)
    }
    
    @objc func sideMenuPressed(sender: UIButton) {
        print("Side menu pressed.")
    }
}
