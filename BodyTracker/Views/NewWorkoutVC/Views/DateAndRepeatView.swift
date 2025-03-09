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
    
    private let repeatLabel = UILabel(text: "Повторять каждые 7 дней",
                                                    color: .specialGray,
                                                    font: UIFont.robotoRegular(size: 18),
                                                    alignment: .left)
    
//    private let currentDateLabel = UILabel(text: "12-12-2024",
//                                           color: .specialGray,
//                                           font: UIFont.robotoRegular(size: 20),
//                                           alignment: .right)
//
    private let datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .red
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let repeatSwitch: UISwitch = {
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
    
    private var repeatStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
        setupView()
        setConstraints()
        addShadowOnView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialDirtyWhite
        
//        addSubview(dateLabel)
//        addSubview(repeatLabel)
//        addSubview(datePicker)
//        addSubview(repeatSwitch)
        addSubview(dateStackView)
        addSubview(repeatStackView)
    }
    
    private func setupStackView() {
        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(datePicker)
        
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel,
                                                         repeatSwitch],
                                      axis: .horizontal,
                                      spacing: 10)
    }
    
//    private func dateCurrent() {
//        let currentDate = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.YYYY"
//
//        self.currentDateLabel.text = formatter.string(from: currentDate)
//    }
}

extension DateAndRepeatView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            
//            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
//            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            dateLabel.heightAnchor.constraint(equalToConstant: 21),
//
//            repeatLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 13),
//            repeatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            repeatLabel.heightAnchor.constraint(equalToConstant: 21),
//
//            datePicker.topAnchor.constraint(equalTo: topAnchor, constant: 17),
//            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            datePicker.heightAnchor.constraint(equalToConstant: 28),
//
//            repeatSwitch.topAnchor.constraint(equalTo: repeatLabel.topAnchor, constant: 0),
//            repeatSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
