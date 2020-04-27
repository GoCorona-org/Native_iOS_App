//
//  CalendarViewCell.swift
//  ScrollableCalendarDemo
//


import UIKit

@IBDesignable class CalendarViewCell: UICollectionViewCell {
    
    var date: Date?
    
    let cellView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        label.textAlignment = .center
        label.textColor = UIColor(rgb: 0x818181)
        label.font = UIFont(name: "HelveticaNeue", size: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    func addViews(){
        
        cellView.addSubview(numberLabel)
        addSubview(cellView)
        
        numberLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        numberLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        cellView.widthAnchor.constraint(equalTo: widthAnchor, constant: -8).isActive = true
        cellView.heightAnchor.constraint(equalTo: heightAnchor, constant: -15).isActive = true
        cellView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
       
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


@IBDesignable class CalendarHeaderView: UICollectionReusableView {
   
    let lineViewBottom: UIView = {
        let lineView = UIView()
        lineView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.1)
        lineView.backgroundColor = UIColor(rgb: 0xD2D2D2)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    let lineViewUp: UIView = {
        let lineView = UIView()
        lineView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.1)
        lineView.backgroundColor = UIColor(rgb: 0xD2D2D2)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        label.text = "1"
        label.textAlignment = .center
        label.textColor = UIColor(rgb: 0x818181)
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    func addViews(){
        addSubview(titleLabel)
        addSubview(lineViewBottom)
        addSubview(lineViewUp)
        backgroundColor = .systemBackground
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        lineViewUp.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lineViewUp.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lineViewUp.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        lineViewUp.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        lineViewBottom.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lineViewBottom.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lineViewBottom.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        lineViewBottom.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DayViewController: UIViewController {

    var date: Date!
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = self.date.toString(dateFormat: "MMMM dd, YYYY")
    }
}


/// View which fades to the system background color at the top and bottom edges
class GradientView: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupGradient()
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupGradient()
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupGradient() {
        gradientLayer.frame = self.bounds
        // Specify five colors here to split gradient into five bands.
        // This way the calendar will fade at the top and bottom edges to give it a 3D look
//        gradientLayer.colors = [UIColor.systemBackground.cgColor,
//                                UIColor.systemBackground.withAlphaComponent(0).cgColor,
//                                UIColor.systemBackground.withAlphaComponent(0).cgColor,
//                                UIColor.systemBackground.withAlphaComponent(0).cgColor,
//                                UIColor.systemBackground.cgColor]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
}
