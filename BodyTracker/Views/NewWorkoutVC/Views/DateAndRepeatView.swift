//
//  DateAndRepeatView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 03.03.2025.
//

import UIKit

class DateAndRepeatView: UIView {
    
    
    private let dateLabel = UILabel(text: "Дата",
                                    color: .specialGray,
                                    font: UIFont.robotoRegular(size: 18),
                                    alignment: .left)
    
    private let repeatEverySevenDaysLabel = UILabel(text: "Повторять каждые 7 дней",
                                                    color: .specialGray,
                                                    font: UIFont.robotoRegular(size: 18),
                                                    alignment: .left)
    
    private let currentDateLabel = UILabel(text: "12-12-2024",
                                           color: .specialGray,
                                           font: UIFont.robotoRegular(size: 20),
                                           alignment: .right)
    
    private let repeatEverSevwnDaysSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .specialGreen
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    private let dateStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        dateCurrent()
        setConstraints()
        addShadowOnView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialDirtyWhite
        
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
