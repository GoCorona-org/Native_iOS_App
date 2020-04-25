//
//  TravelQuestionnaireFirstViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/20.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit
import SearchTextField

class TravelQuestionnaireFirstViewController: CrossCheckViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let travelQuestionnaireHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.text = "Have you travelled anywhere abroad in the last 20 days?"
        view.textAlignment = .left
        view.numberOfLines = 2
        view.lineBreakMode =  .byWordWrapping
        view.textColor = UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Medium", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pageicon: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 230)
        view.image = UIImage(named: "travelcheckicon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "Or even arrived in India in the last 20 days?"
        view.textAlignment = .left
        view.backgroundColor = .systemBackground
        view.textColor = UIColor.label//UIColor(rgb: 0x1C1C1C)
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSectionTableView: UITableView = {
        let view = UITableView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        view.tag = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstTableCellId = "foreignArrivalCellID"
    
    let secondSectionHeading: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 20)
        view.text = "If yes, then select the countries you visited before coming to India"
        view.textAlignment = .left
        view.backgroundColor = .systemBackground
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textColor = UIColor.label
        view.font = UIFont(name: "FiraSans-Light", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let countryField: SearchTextField = {
        let view = SearchTextField()
        view.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        view.backgroundColor = UIColor(rgb: 0xE9E9E9)
        view.layer.cornerRadius = 5.0
        view.attributedPlaceholder = NSAttributedString(string: "Search Country", attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x989898)])
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        view.leftViewMode = .always
        view.font = UIFont(name: "HelveticaNeue", size: 16.0)
        view.maxNumberOfResults = 5
        view.maxResultsListHeight = 150
        //view.filterStrings(["India", "Japan", "Australia", "Nepal", "Bhutan", "New Zealand"])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        view.layer.cornerRadius = 4.0
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.backgroundColor = UIColor(rgb: 0xA9E7CB)
        view.setTitle("Add", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x989898), for: .normal)
        view.addTarget(self, action: #selector(addButtonIsTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return  view
    }()
    
    let countryListTableView: UITableView = {
        let view = UITableView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        view.tag = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let countryCellIdentifier = "countryCellID"
    
    var selectedCountryList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstSectionTableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: firstTableCellId)
        firstSectionTableView.delegate = self
        firstSectionTableView.dataSource = self
        
        countryListTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: countryCellIdentifier)
        countryListTableView.delegate = self
        countryListTableView.dataSource = self
        
        introductionLabel.text = "Patient"
        backButton.isHidden = false
        nextButton.isHidden = false
        
        let countries = localCountries()
        countryField.filterStrings(countries)
        
        countryListTableView.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        //countryListTableView.heightAnchor.constraint(equalToConstant: CGFloat(35 * selectedCountryList.count)).isActive = true
    }
    
    override func addIntoBodyView() {
        bodyBaseView.addSubview(travelQuestionnaireHeading)
        bodyBaseView.addSubview(pageicon)
        bodyBaseView.addSubview(firstSectionHeading)
        bodyBaseView.addSubview(firstSectionTableView)
        bodyBaseView.addSubview(secondSectionHeading)
        bodyBaseView.addSubview(countryField)
        bodyBaseView.addSubview(addButton)
        bodyBaseView.addSubview(countryListTableView)
    }
    
    override func placeBodyViews() {
        travelQuestionnaireHeading.topAnchor.constraint(equalTo: bodyBaseView.topAnchor, constant: 10).isActive = true
        travelQuestionnaireHeading.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor, constant: -15).isActive = true
        travelQuestionnaireHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        travelQuestionnaireHeading.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        pageicon.topAnchor.constraint(equalTo: travelQuestionnaireHeading.bottomAnchor, constant: 10).isActive = true
        pageicon.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor, constant: 25).isActive = true
        pageicon.trailingAnchor.constraint(equalTo: bodyBaseView.trailingAnchor, constant: -25).isActive = true
        pageicon.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        firstSectionHeading.topAnchor.constraint(equalTo: pageicon.bottomAnchor, constant: 20).isActive = true
        firstSectionHeading.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor).isActive = true
        firstSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        firstSectionHeading.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        firstSectionTableView.topAnchor.constraint(equalTo: firstSectionHeading.bottomAnchor).isActive = true
        firstSectionTableView.leadingAnchor.constraint(equalTo: bodyBaseView.leadingAnchor).isActive = true
        firstSectionTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        firstSectionTableView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        secondSectionHeading.topAnchor.constraint(equalTo: firstSectionTableView.bottomAnchor, constant: 20).isActive = true
        secondSectionHeading.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor).isActive = true
        secondSectionHeading.widthAnchor.constraint(equalToConstant: 350).isActive = true
        secondSectionHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        countryField.topAnchor.constraint(equalTo: secondSectionHeading.bottomAnchor, constant: 5).isActive = true
        countryField.leadingAnchor.constraint(equalTo: travelQuestionnaireHeading.leadingAnchor).isActive = true
        countryField.trailingAnchor.constraint(equalTo: travelQuestionnaireHeading.trailingAnchor).isActive = true
        countryField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        addButton.topAnchor.constraint(equalTo: countryField.bottomAnchor, constant: 10).isActive = true
        addButton.leadingAnchor.constraint(equalTo: countryField.leadingAnchor, constant: 0).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        countryListTableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10).isActive = true
        countryListTableView.leadingAnchor.constraint(equalTo: addButton.leadingAnchor).isActive = true
        countryListTableView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        countryListTableView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    @objc func addButtonIsTapped() {
        if let country = countryField.text {
            selectedCountryList.append(country)
            countryField.text = ""
            countryListTableView.reloadData()
            countryListTableView.isHidden = false
        }
    }
    
    override func backButtonIsTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func nextButtonIsTapped(sender: UIButton) {
        print("Next button is tapped.")
    }
    
    fileprivate func localCountries() -> [String] {
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .dataReadingMapped)
                guard let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [[String:String]] else {
                    print("JSON result is not found correctly.")
                    return []
                }
                
                var countryNames = [String]()
                for country in jsonResult {
                    countryNames.append(country["name"]!)
                }
                
                return countryNames
            } catch {
                print("Error parsing jSON: \(error)")
                return []
            }
        }
        return []
    }
}
extension TravelQuestionnaireFirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return options.count
        } else if tableView.tag == 1 {
            return selectedCountryList.count
        } else {
            return options.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0, let cell = tableView.dequeueReusableCell(withIdentifier: firstTableCellId, for: indexPath) as? OptionsTableViewCell {
            cell.textLabel?.text = options[indexPath.item]
            return cell
        } else if tableView.tag == 1, let cell = tableView.dequeueReusableCell(withIdentifier: countryCellIdentifier, for: indexPath) as? CountryTableViewCell {
            cell.textLabel?.text = selectedCountryList[indexPath.item]
            cell.delegate = self
            return cell
        }/* else if tableView.tag == 2, let cell = tableView.dequeueReusableCell(withIdentifier: thirdTableCellId, for: indexPath) as? OptionsTableViewCell {
            cell.textLabel?.text = options[indexPath.item]
            return cell
        }*/ else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            return UITableView.automaticDimension
        }
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///print(healthHistorySymptoms[indexPath.item])
    }
}
extension TravelQuestionnaireFirstViewController: CountryCellDelegate {
    func didTapCloseButtonInCell(_ cell: CountryTableViewCell) {
        if let countryText = cell.textLabel?.text, selectedCountryList.contains(countryText) {
            selectedCountryList.removeAll(where: {$0 == countryText})
            if selectedCountryList.count == 0 {
                countryListTableView.isHidden = true
            }
            countryListTableView.reloadData()
        }
    }
    
    
}
