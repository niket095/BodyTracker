//
//  CalendarCollectionViewCell.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 19.02.2025.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "CalendarCollectionViewCell"
    
    //MARK: - UI Elements
    private let dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.textColor = .white
        label.font = UIFont.robotoBold(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfDayLabel: UILabel = {
        let label = UILabel()
        label.text = "14"
        label.textColor = .white
        label.font = UIFont.robotoBold(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life cicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        layer.cornerRadius = Constants.radiusCorner
        
        addSubview(dayOfWeekLabel)
        addSubview(numberOfDayLabel)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = .yellow
                dayOfWeekLabel.textColor = .black
                numberOfDayLabel.textColor = .black
            } else {
                backgroundColor = .clear
                dayOfWeekLabel.textColor = .white
                numberOfDayLabel.textColor = .white
            }
        }
    }
    
    public func cellConfigure(numberOfDay: String, dayOfWeek: String) {
        dayOfWeekLabel.text = dayOfWeek
        numberOfDayLabel.text = numberOfDay
    }
}

//MARK: - Constraints
extension CalendarCollectionViewCell{
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            numberOfDayLabel.topAnchor.constraint(equalTo: dayOfWeekLabel.bottomAnchor, constant: 5),
            numberOfDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
