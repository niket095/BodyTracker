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
    
    private let newWorkoutLabel = UILabel(text: "Новая тренировка", color: .black, font: UIFont.robotoBold(size: 24))
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .green
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel = UILabel(text: "ИМЯ", color: .black, font: UIFont.robotoRegular(size: 14))
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
    }
}
