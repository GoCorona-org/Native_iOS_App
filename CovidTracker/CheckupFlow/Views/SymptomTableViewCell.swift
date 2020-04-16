//
//  SymptomTableViewCell.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/14.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class SymptomTableViewCell: UITableViewCell {
    
    let checkbox: Checkbox = {
        let view = Checkbox()
        view.frame = CGRect(x: 20, y: 5, width: 30, height: 30)
        view.borderStyle = .square
        view.checkmarkStyle = .tick
        view.checkboxFillColor = UIColor(red: 239, green: 239, blue: 239)
        view.useHapticFeedback = true
        view.uncheckedBorderColor = UIColor.gray
        view.checkedBorderColor = UIColor(red: 231, green: 46, blue: 104)
        view.checkmarkColor = UIColor(red: 231, green: 46, blue: 104)
        view.borderCornerRadius = 2.0
        view.checkmarkSize = 0.75
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = UIFont(name: "FiraSans-ExtraLight", size: 16.0)
        textLabel?.numberOfLines = 0
        textLabel?.textColor = .black
        textLabel?.textAlignment = .right
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OptionsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = UIFont(name: "FiraSans-ExtraLight", size: 16.0)
        textLabel?.numberOfLines = 0
        textLabel?.textColor = .black
        textLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
