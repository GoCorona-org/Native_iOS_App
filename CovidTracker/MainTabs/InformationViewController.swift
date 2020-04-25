//
//  InformationViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/11.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let tableView: UITableView = {
        let view = UITableView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.text = "Info"
        view.textColor = .black
        view.font = UIFont(name: "FiraSans-Medium", size: 26.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableCellId = "travelOptionsCellID"
    
    let menuOptions = ["Helpline", "FAQs", "Logout"]
    let symbolNames = ["teletype", "bubble.left.and.bubble.right.fill", "chevron.right.circle"]
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        let navView = createNavView()
        if let menuButton = navView.subviews.first(where: {$0 is UIButton}) as? UIButton {
            menuButton.addTarget(self, action: #selector(sideMenuPressed(sender:)), for: .touchUpInside)
        }
        view.addSubview(navView)
        
        tableView.register(MenuViewCell.self, forCellReuseIdentifier: tableCellId)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        titleLabel.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 15.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 135).isActive = true
    }
    
    @objc func sideMenuPressed(sender: UIButton) {
        print("Side menu pressed.")
    }
}
extension InformationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath) as? MenuViewCell {
            cell.iconImage.image = UIImage(systemName: symbolNames[indexPath.item], withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .light))
            cell.label.text = menuOptions[indexPath.item]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

class MenuViewCell: UITableViewCell {
    
    let iconImage: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        view.contentMode = .scaleAspectFit
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 40)
        view.font = UIFont(name: "FiraSans-Regular", size: 20.0)
        view.textColor = UIColor.label
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(iconImage)
        contentView.addSubview(label)
        
        iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        label.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10).isActive = true
        label.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
        label.heightAnchor .constraint(equalToConstant: 40).isActive = true
        
        textLabel?.font = UIFont(name: "FiraSans-Regular", size: 20.0)
        textLabel?.numberOfLines = 0
        textLabel?.textColor = UIColor.label
        textLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
