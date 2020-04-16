//
//  TabBarController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/11.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        tabBar.backgroundColor = .white
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xE72E68)], for: UIControl.State.selected)
        homeVC.tabBarItem.image = UIImage(named: "hometab")
        homeVC.tabBarItem.selectedImage = UIImage(named: "hometabselected")
        
        let qVC = QuarantineViewController()
        qVC.tabBarItem.title = "Quarantine"
        qVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xE72E68)], for: UIControl.State.selected)
        qVC.tabBarItem.image = UIImage(named: "quarantine")
        qVC.tabBarItem.selectedImage = UIImage(named: "quarantineselected")
        
        let checkupVC = UINavigationController(rootViewController: CheckupViewController())
        checkupVC.tabBarItem.title = "Checkup"
        checkupVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xE72E68)], for: UIControl.State.selected)
        checkupVC.tabBarItem.image = UIImage(named: "checkup")
        checkupVC.tabBarItem.selectedImage = UIImage(named: "checkupselected")
        
        let crossCheckVC = UINavigationController(rootViewController: CrossCheckViewController())
        crossCheckVC.tabBarItem.title = "Cross Check"
        crossCheckVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xE72E68)], for: UIControl.State.selected)
        crossCheckVC.tabBarItem.image = UIImage(named: "crosscheck")
        crossCheckVC.tabBarItem.selectedImage = UIImage(named: "crosscheckselected")
        
        let infoVC = InformationViewController()
        infoVC.tabBarItem.title = "Information"
        infoVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xE72E68)], for: UIControl.State.selected)
        infoVC.tabBarItem.image = UIImage(named: "information")
        infoVC.tabBarItem.selectedImage = UIImage(named: "informationselected")
        
        viewControllers = [homeVC, qVC, checkupVC, crossCheckVC, infoVC]
        
        selectedViewController = homeVC
    }
    
    @objc func sideMenuPressed(sender: UIButton) {
        print("Side menu is now pressed.")
    }
    
}
