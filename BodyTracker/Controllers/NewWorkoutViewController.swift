//
//  NewWorkoutViewController.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 27.02.2025.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let newWorkoutLabel = UILabel(text: "Новая тренировка",
                                          color: .specialGray,
                                          font: UIFont.robotoBold(size: 24),
                                          alignment: .left)
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .specialDirtyWhite
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.backgroundColor = .specialGreen
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel = UILabel(text: "Имя",
                                    color: .specialBeige,
                                    font: UIFont.robotoRegular(size: 14),
                                    alignment: .left)
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialDirtyWhite
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.keyboardType = .default
        textField.layer.cornerRadius = Constants.radiusCorner
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addShadowOnView()
        return textField
    }()
    
    private let dateOrRepeatLabel = UILabel(text: "Дата и повторы",
                                            color: .specialBeige,
                                            font: UIFont.robotoRegular(size: 14),
                                            alignment: .left)
    
    private let repsOrTimerLabel = UILabel(text: "Повторы или таймер",
                                           color: .specialBeige,
                                           font: UIFont.robotoRegular(size: 14),
                                           alignment: .left)
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.tintColor = .white
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = Constants.radiusCorner
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dateOrRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        closeButton.layer.cornerRadius = closeButton.frame.height/2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        setTarget()
    }
    
    private func setupView() {
        view.backgroundColor = .specialBackgoundColor
        view.addSubview(scrollView)
        scrollView.addSubview(newWorkoutLabel)
        scrollView.addSubview(closeButton)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(textField)
        scrollView.addSubview(dateOrRepeatLabel)
        scrollView.addSubview(dateOrRepeatView)
        scrollView.addSubview(repsOrTimerLabel)
        scrollView.addSubview(repsOrTimerView)
        scrollView.addSubview(saveButton)
    }
}

extension NewWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            newWorkoutLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newWorkoutLabel.heightAnchor.constraint(equalToConstant: 24),
            
            closeButton.topAnchor.constraint(equalTo: newWorkoutLabel.topAnchor, constant: 0),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 15),
            closeButton.widthAnchor.constraint(equalToConstant: 15),
            
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            
            textField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 38),
            
            dateOrRepeatLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 14),
            dateOrRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            dateOrRepeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateOrRepeatLabel.heightAnchor.constraint(equalToConstant: 16),
            
            dateOrRepeatView.topAnchor.constraint(equalTo: dateOrRepeatLabel.bottomAnchor,constant: 2),
            dateOrRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateOrRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateOrRepeatView.heightAnchor.constraint(equalToConstant: 93),
            
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateOrRepeatView.bottomAnchor, constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOrTimerLabel.heightAnchor.constraint(equalToConstant: 16),
            
            repsOrTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 2),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 275),
            
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 25),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

extension NewWorkoutViewController {
    private func setTarget() {
        closeButton.addTarget(self, action: #selector(backMainVC), for: .touchUpInside)
    }
    
    @objc private func backMainVC() {
        let vc = NewWorkoutViewController()
        self.dismiss(animated: true, completion: nil)
    }
}
