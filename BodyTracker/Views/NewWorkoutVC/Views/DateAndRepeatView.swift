//
//  DateAndRepeatView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 03.03.2025.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let backgroundDateAndRepeat: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.specialDirtyWhite
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dateLabel = UILabel(text: "Дата", color: .specialGray, font: UIFont.robotoRegular(size: 18))
    
    private let repeatEverySevenDaysLabel = UILabel(text: "Повторять каждые 7 дней", color: .specialGray, font: UIFont.robotoRegular(size: 18))
    
    private let currentDateLabel = UILabel(text: "12-12-2024", color: .specialGray, font: UIFont.robotoRegular(size: 20))
    
    private let repeatEverSevwnDaysSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .specialGreen
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
        dateCurrent()
        setConstraints()
        addShadowOnView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(backgroundDateAndRepeat)
        addSubview(dateLabel)
        addSubview(repeatEverySevenDaysLabel)
        addSubview(currentDateLabel)
        addSubview(repeatEverSevwnDaysSwitch)
    }
    
    private func dateCurrent() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        
        self.currentDateLabel.text = formatter.string(from: currentDate)
    }
}

extension DateAndRepeatView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundDateAndRepeat.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundDateAndRepeat.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundDateAndRepeat.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundDateAndRepeat.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateLabel.heightAnchor.constraint(equalToConstant: 21),
            
            repeatEverySevenDaysLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 13),
            repeatEverySevenDaysLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repeatEverySevenDaysLabel.heightAnchor.constraint(equalToConstant: 21),
            
            currentDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            currentDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            currentDateLabel.heightAnchor.constraint(equalToConstant: 28),
            
            repeatEverSevwnDaysSwitch.topAnchor.constraint(equalTo: repeatEverySevenDaysLabel.topAnchor, constant: 0),
            repeatEverSevwnDaysSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
