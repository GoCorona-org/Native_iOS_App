//
//  Common.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/10.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

var bodySize: CGSize?
var checkupProgress: Float = 0.0

func createNavView() -> UIView {
    let view = UIView()
    view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 85)
    view.backgroundColor = UIColor(rgb: 0xE72E68)
    
    let label = UILabel()
    label.frame = CGRect(x: 70, y: 30, width: 200, height: 60)
    label.text = "SPOT CORONA"
    label.textColor = .white
    label.textAlignment = .left
    label.font = UIFont(name: "FiraSans-Regular", size: 20.0)
    view.addSubview(label)
    
    let iconView = UIImageView()
    iconView.frame = CGRect(x: 20, y: 45, width: 30, height: 30)
    iconView.image = UIImage(named: "coronaicon")
    iconView.contentMode = .scaleAspectFit
    view.addSubview(iconView)
    
    let button = UIButton()
    button.frame = CGRect(x: UIScreen.main.bounds.width - 50, y: 55, width: 22.5, height: 15)
    button.setBackgroundImage(UIImage(named: "sidemenu"), for: .normal)
    button.contentMode = .scaleAspectFit
    //button.addTarget(viewController, action: #selector(TabBarController.sideMenuPressed(sender:)), for: .touchUpInside)
    view.addSubview(button)
    
    return view
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension UITapGestureRecognizer {

    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
        )
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y
        )
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        return NSLocationInRange(indexOfCharacter, targetRange)
    }

}
