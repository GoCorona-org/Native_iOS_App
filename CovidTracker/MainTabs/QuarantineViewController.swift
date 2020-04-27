//
//  QuarantineViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/11.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit

class QuarantineViewController: UIViewController{
    
    var collectionView: UICollectionView!
    var cellId = "Cell"
    let numberOfPastMonths: Int = 12
    let numberOfFutureMonths: Int = 12
    let cellHeight: Int = 55
    let headerHeight: Int = 50
    
    let calendar = Calendar.init(identifier: .gregorian)
    
    var selectedDate: Date?
    var firstTimeRunning = true
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let scrollBaseView: UIView = {
        let view = UIView()
        var finalHeight: CGFloat = 0.0
        if let size = bodySize  {
            finalHeight = size.height
        } else {
            finalHeight = 550
        }
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: finalHeight)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70)
        view.backgroundColor = .clear
        let lineView = UIView()
        lineView.frame = CGRect(x: 0, y: 58, width: UIScreen.main.bounds.width, height: 1)
        lineView.backgroundColor = UIColor(rgb: 0xD2D2D2)
        view.addSubview(lineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let myCalenderLabel: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 25)
        view.text = "MY CALENDER"
        view.textAlignment = .center
        view.textColor = .black
        view.font = UIFont(name: "HelveticaNeue", size: 17)
        view.font = UIFont.boldSystemFont(ofSize: 17.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let quarantineButton: UIButton = {
        let view = UIButton()
        view.frame =  CGRect(x: 0, y: 0, width: 102, height: 35)
        view.layer.cornerRadius = 4.0
        view.backgroundColor = UIColor(rgb: 0xFFB8C4)
        view.titleLabel?.textAlignment = .center
        view.setTitle("Quarantine", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0.7
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        //           view.addTarget(self, action: #selector(nextButtonIsTapped(sender:)), for: .touchUpInside)
        return view
    }()
    
    let shoppingDaysButton: UIButton = {
        let view = UIButton()
        view.frame =  CGRect(x: 0, y: 0, width: 128, height: 35)
        view.layer.cornerRadius = 4.0
        view.backgroundColor = UIColor(rgb: 0xA9E7CB)
        view.titleLabel?.textAlignment = .center
        view.setTitle("Shopping days", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0.7
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        //           view.addTarget(self, action: #selector(nextButtonIsTapped(sender:)), for: .touchUpInside)
        return view
    }()
    
    let bodyBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gradientView: GradientView = {
           let view = GradientView()
           view.frame = CGRect(x: 0, y: 0, width: 330, height: 330)
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       let calendarView: UIView = {
           let view = UIView()
           view.frame = CGRect(x: 0, y: 0, width: 330, height: 550)
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       func createCalenderView() {
           let layout: SeparatorCollectionViewFlowLayout = SeparatorCollectionViewFlowLayout()
           layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
           layout.minimumInteritemSpacing = 0
           layout.minimumLineSpacing = 1
           collectionView = UICollectionView(frame: scrollBaseView.frame, collectionViewLayout: layout)
           
           self.navigationController?.setNavigationBarHidden(true, animated: false)
           
           collectionView.delegate = self
           collectionView.dataSource = self
           
           // Register the header view
           collectionView.register(CalendarHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "calendarHeaderView")
           // Register the cell view
           collectionView.register(CalendarViewCell.self, forCellWithReuseIdentifier: "calendarCell")
           collectionView.showsVerticalScrollIndicator = false
           collectionView.backgroundColor = UIColor.white
       }
    
    var navView: UIView?
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        navView = createNavView()
        if let nav = navView, let menuButton = nav.subviews.first(where: {$0 is UIButton}) as? UIButton {
            menuButton.addTarget(self, action: #selector(sideMenuPressed(sender:)), for: .touchUpInside)
            view.addSubview(nav)
        }
        
        
        addViews()
        placeViews()
        
        createCalenderView()
        placeCalenderViews()
        let navView = createNavView()
        if let menuButton = navView.subviews.first(where: {$0 is UIButton}) as? UIButton {
            menuButton.addTarget(self, action: #selector(sideMenuPressed(sender:)), for: .touchUpInside)
        }
        
        view.addSubview(navView)
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        bodySize = bodyBaseView.frame.size
        
        let today = Date()
        let year = calendar.component(.year, from: today)
        let month = calendar.component(.month, from: today)
        let day = calendar.component(.day, from: today)
        let dayOffset = self.dayOffset(year: year, month: month)
        
        if firstTimeRunning {
            collectionView.scrollToItem(at: IndexPath(item: day + dayOffset + 7, section: numberOfPastMonths), at: .centeredVertically, animated: false)
            firstTimeRunning = false
        }        
    }
        
    private func addViews() {
        
        headerView.addSubview(quarantineButton)
        headerView.addSubview(myCalenderLabel)
        headerView.addSubview(shoppingDaysButton)
        bodyBaseView.addSubview(headerView)
        bodyBaseView.addSubview(scrollBaseView)
    
        view.addSubview(bodyBaseView)
    }
    
    
    private func placeViews() {
        if let nav = navView {
            headerView.topAnchor.constraint(equalTo: nav.bottomAnchor, constant: 0).isActive = true
        } else {
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60).isActive = true
        }
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        myCalenderLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 22).isActive = true
        myCalenderLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        myCalenderLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 80).isActive = true
        myCalenderLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        myCalenderLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        quarantineButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 80).isActive = true
        quarantineButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 60).isActive = true
        quarantineButton.widthAnchor.constraint(equalToConstant: 102).isActive = true
        quarantineButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        shoppingDaysButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 80).isActive = true
        shoppingDaysButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -95).isActive = true
        shoppingDaysButton.leadingAnchor.constraint(equalTo: quarantineButton.trailingAnchor, constant: 10).isActive = true
        shoppingDaysButton.widthAnchor.constraint(equalToConstant: 128).isActive = true
        shoppingDaysButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        bodyBaseView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        bodyBaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bodyBaseView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bodyBaseView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        scrollBaseView.topAnchor.constraint(equalTo: bodyBaseView.topAnchor).isActive = true
        scrollBaseView.widthAnchor.constraint(equalTo: bodyBaseView.widthAnchor).isActive = true
        scrollBaseView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 20).isActive = true
        scrollBaseView.heightAnchor.constraint(equalTo: bodyBaseView.heightAnchor).isActive = true
    }
    
    private func placeCalenderViews() {
        
        calendarView.addSubview(collectionView)
        gradientView.addSubview(calendarView)
        scrollBaseView.addSubview(gradientView)
        
        calendarView.frame = CGRect(x: scrollBaseView.frame.minX, y: scrollBaseView.frame.minY, width: scrollBaseView.frame.width - 20, height: scrollBaseView.frame.height - 20)
        
        gradientView.topAnchor.constraint(equalTo: scrollBaseView.topAnchor).isActive = true
        gradientView.leadingAnchor.constraint(equalTo: scrollBaseView.leadingAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: scrollBaseView.trailingAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: scrollBaseView.bottomAnchor).isActive = true

        calendarView.topAnchor.constraint(equalTo: scrollBaseView.topAnchor).isActive = true
        calendarView.leadingAnchor.constraint(equalTo: scrollBaseView.leadingAnchor).isActive = true
        calendarView.trailingAnchor.constraint(equalTo: scrollBaseView.trailingAnchor).isActive = true
        calendarView.bottomAnchor.constraint(equalTo: scrollBaseView.bottomAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: scrollBaseView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: scrollBaseView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: scrollBaseView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: scrollBaseView.bottomAnchor).isActive = true
    }

    
    
    @objc func sideMenuPressed(sender: UIButton) {
        print("Side menu pressed.")
    }
}
