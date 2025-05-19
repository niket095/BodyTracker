//

//  DateAndRepeatView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 03.03.2025.
//

import UIKit

class DateAndRepeatView: UIView {
    
    //MARK: - UI Elements
    private let dateLabel = UILabel(text: "Дата",
                                    color: .specialGray,
                                    font: UIFont.robotoRegular(size: 18),
                                    alignment: .left)
    
    private let repeatLabel = UILabel(text: "Повторять каждые 7 дней",
                                      color: .specialGray,
                                      font: UIFont.robotoRegular(size: 18),
                                      alignment: .left)
    
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
    
    //MARK: - Life cicle
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
    
    //MARK: - Setup stack
    private func setupStackView() {
        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(datePicker)
        
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel,
                                                         repeatSwitch],
                                      axis: .horizontal,
                                      spacing: 10)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialDirtyWhite
        layer.cornerRadius = Constants.radiusCorner
        
        addSubview(dateStackView)
        addSubview(repeatStackView)
    }
}

//MARK: - Constraints
extension DateAndRepeatView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17)
        ])
    }
}
