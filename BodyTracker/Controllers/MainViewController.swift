//
//  ViewController.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 21.01.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - UI Elemetns
    private let userLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый пользователь"
        label.textColor = UIColor.specialGray
        label.font = UIFont.robotoBold(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutTodayLabel: UILabel = {
        let label = UILabel()
        label.text = "Тренировка сегодня"
        label.textColor = UIColor.specialBeige
        label.font = UIFont.robotoRegular(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let trainingLabel: UILabel = {
        let label = UILabel()
        label.text = "Нет тренировки"
        label.textColor = UIColor.specialGray
        label.font = UIFont.robotoBold(size: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionTrainingLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажните на кнопку Добавить"
        label.textColor = UIColor.specialGray
        label.font = UIFont.robotoRegular(size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userPhotoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.Images.noNameImage)
        imageView.backgroundColor = .specialLightGrey
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let peopleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.Images.peopleImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addShadowOnView()
        return imageView
    }()
    
    private let addWorkButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Добавить"
        configuration.image = UIImage (systemName: "plus")
        configuration.imagePlacement = .top
        configuration.imagePadding = 10
        configuration.baseBackgroundColor = .specialYellow
        configuration.baseForegroundColor = .specialDarkGreen
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addShadowOnView()
        return button
    }()
    
    private let weatherView = WeatherView()
    private let calendarView = CalendarView()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        userPhotoImage.layer.cornerRadius = userPhotoImage.frame.height/2
    }
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        setTarget()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.specialBackgoundColor
        view.addSubview(calendarView)
        view.addSubview(userPhotoImage)
        view.addSubview(userLabel)
        view.addSubview(weatherView)
        view.addSubview(addWorkButton)
        view.addSubview(workoutTodayLabel)
        view.addSubview(peopleImage)
        view.addSubview(trainingLabel)
        view.addSubview(descriptionTrainingLabel)
    }
}

//
extension MainViewController{
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            userPhotoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            userPhotoImage.widthAnchor.constraint(equalToConstant: 100),
            userPhotoImage.heightAnchor.constraint(equalToConstant: 100),
            
            userLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 31),
            userLabel.leadingAnchor.constraint(equalTo: userPhotoImage.trailingAnchor, constant: 6),
            userLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            calendarView.topAnchor.constraint(equalTo: userPhotoImage.topAnchor, constant: 50),
            calendarView.leadingAnchor.constraint(equalTo: userPhotoImage.leadingAnchor, constant: 0),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            calendarView.heightAnchor.constraint(equalToConstant: 69),
            
            addWorkButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 9),
            addWorkButton.trailingAnchor.constraint(equalTo: calendarView.trailingAnchor, constant: 0),
            addWorkButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkButton.widthAnchor.constraint(equalToConstant: 80),
            
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 9),
            weatherView.leadingAnchor.constraint(equalTo: calendarView.leadingAnchor, constant: 0),
            weatherView.trailingAnchor.constraint(equalTo: addWorkButton.leadingAnchor, constant: -9),
            weatherView.heightAnchor.constraint(equalToConstant: 80),
            
            workoutTodayLabel.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 11),
            workoutTodayLabel.leadingAnchor.constraint(equalTo: weatherView.leadingAnchor, constant: 0),
            
            peopleImage.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor, constant: 24),
            peopleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            peopleImage.heightAnchor.constraint(equalToConstant: 300),
            peopleImage.widthAnchor.constraint(equalToConstant: 251),
            
            trainingLabel.topAnchor.constraint(equalTo: peopleImage.bottomAnchor, constant: 13),
            trainingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trainingLabel.heightAnchor.constraint(equalToConstant: 43),
            
            descriptionTrainingLabel.topAnchor.constraint(equalTo: trainingLabel.bottomAnchor, constant: 1),
            descriptionTrainingLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTrainingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            descriptionTrainingLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
    
    //MARK: - Target
    private func setTarget() {
        addWorkButton.addTarget(self, action: #selector(addWorkButtonAction), for: .touchUpInside)
    }
    
    @objc private func addWorkButtonAction() {
        let vc = NewWorkoutViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
