//

//  NewWorkoutViewController.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 27.02.2025.
//
//

import UIKit
import SwiftUI

class NewWorkoutViewController: UIViewController, WorkoutTableViewCellDelegate, CollectionImageWorkoutViewControllerDelegate {
    func imageTapped(with image: UIImage) {
        repsOrTimerView.setupImageView(image: image)
    }
    
    
    
    func actionOfStartButton() {
        let vc = CollectionImageWorkoutViewController()
        vc.collectionDelegate = self
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(vc, animated: true)
    }

    //MARK: - UI Elements
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
        let button = UIButton(type: .custom)
        let image = UIImage(resource: .close)
        button.setBackgroundImage(image, for: .normal)
        button.setTitleColor(UIColor.specialBackgoundColor, for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel = UILabel(text: "Имя",
                                    color: .specialBeige,
                                    font: UIFont.robotoRegular(size: 14),
                                    alignment: .left)
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialDirtyWhite
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.keyboardType = .default
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftViewMode = .always
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
    private let collectionVC = CollectionImageWorkoutViewController()
    //MARK: - Life cicle
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
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(dateOrRepeatLabel)
        scrollView.addSubview(dateOrRepeatView)
        scrollView.addSubview(repsOrTimerLabel)
        scrollView.addSubview(repsOrTimerView)
        scrollView.addSubview(saveButton)
        
        collectionVC.collectionDelegate = self
        repsOrTimerView.repsOrTimerViewDelegate = self
    }
}

extension NewWorkoutViewController {
    
    //MARK: - Constraints
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
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38),
            
            dateOrRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 14),
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
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 500),
            
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 25),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
            
        ])
    }
    
    //MARK: - Target
    private func setTarget() {
        closeButton.addTarget(self, action: #selector(backMainVC), for: .touchUpInside)
    }
    
    @objc private func backMainVC() {
        self.dismiss(animated: true, completion: nil)
    }
}


//MARK: - Delegate TextField
extension NewWorkoutViewController: UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
    }
}

struct NewWorkoutViewControllerProviders: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = NewWorkoutViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<NewWorkoutViewControllerProviders.ContainerView>) -> NewWorkoutViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: NewWorkoutViewControllerProviders.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<NewWorkoutViewControllerProviders.ContainerView>) {
        }
    }
}


