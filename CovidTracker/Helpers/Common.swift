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

extension Date {
    func toString( dateFormat format  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func toShortTimeString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: self)
    }
}

var userUUID: String = ""
var intersectionUUID: String = ""
var medicalUUID: String = ""


let countries = [ "USA", "Italy", "China", "Spain", "Germany", "France", "Iran", "UK", "Switzerland", "Netherlands", "Belgium", "S. Korea", "Turkey", "Austria", "Canada", "Portugal", "Israel", "Norway", "Brazil", "Australia", "Sweden", "Czechia", "Ireland", "Malaysia", "Denmark", "Chile", "Luxembourg", "Ecuador", "Poland", "Japan", "Romania", "Pakistan", "Russia", "Thailand", "Philippines", "SaudiArabia", "Indonesia", "South Africa", "Finland", "Greece", "India", "Iceland", "Mexico", "Panama", "Dominican Republic", "Peru", "Singapore", "Argentina", "Serbia", "Slovenia", "Estonia", "Croatia", "Colombia", "Hong Kong", "Qatar", "Egypt", "New Zealand", "UAE", "Iraq", "Bahrain", "Algeria", "Lithuania", "Ukraine", "Hungary", "Lebanon", "Armenia", "Latvia", "Bulgaria", "Bosnia and Herzegovina", "Andorra", "Costa Rica", "Slovakia", "Tunisia", "Uruguay", "Taiwan", "Kazakhstan", "Moldova", "North Macedonia", "Jordan", "Kuwait", "San Marino", "Burkina Faso", "Cyprus", "Albania", "Azerbaijan", "Vietnam", "Réunion", "Oman", "Ivory Coast", "Faeroe Islands", "Ghana", "Malta", "Uzbekistan", "Senegal", "Cameroon", "Cuba", "Honduras", "Brunei", "Afghanistan", "Sri Lanka", "Venezuela", "Nigeria", "Mauritius", "Palestine", "Channel Islands", "Guadeloupe", "Cambodia", "Georgia", "Bolivia", "Belarus", "Martinique", "Montenegro", "Kyrgyzstan", "DRC", "Trinidad and Tobago", "Rwanda", "Gibraltar", "Paraguay", "Mayotte", "Liechtenstein", "Aruba", "Bangladesh", "Monaco", "French Guiana", "Kenya", "Isle of Man", "Madagascar", "Macao", "Guatemala", "Barbados", "Uganda", "Jamaica", "Togo", "El Salvador", "French Polynesia", "Zambia", "Bermuda", "Ethiopia", "Congo", "Mali", "Niger", "Djibouti", "Maldives", "Guinea", "Haiti", "New Caledonia", "Bahamas", "Tanzania", "Cayman Islands", "Equatorial Guinea", "Eritrea", "Mongolia", "Dominica", "Namibia", "Saint Martin", "Greenland", "Myanmar", "Syria", "Grenada", "Saint Lucia", "Eswatini", "Curaçao", "Guyana", "Laos", "Libya", "Mozambique", "Seychelles", "Suriname", "Angola", "Gabon", "Zimbabwe", "Antigua and Barbuda", "Cabo Verde", "Sudan", "Benin", "Vatican City", "Sint Maarten", "Nepal", "Fiji", "Mauritania", "Montserrat", "St. Barth", "Gambia", "Nicaragua", "Bhutan", "Turks and Caicos", "CAR", "Chad", "Liberia", "Somalia", "MS Zaandam", "Anguilla", "Belize", "British Virgin Islands", "Guinea -Bissau", "Saint Kitts and Nevis", "Papua New Guinea", "St. Vincent Grenadines" ]

let indianStates = ["Andaman and Nicobar Islands", "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chandigarh", "Chhattisgarh", "Dadra and Nagar Haveli and Daman and Diu", "Delhi", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Ladakh", "Lakshadweep", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghlaya", "Mizoram", "Nagaland", "Odisha", "Puducherry", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal"]
