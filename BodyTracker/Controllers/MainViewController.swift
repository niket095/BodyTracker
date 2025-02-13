//
//  ViewController.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 21.01.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    private let userLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый пользователь"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Погода"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutTodayLabel: UILabel = {
        let label = UILabel()
        label.text = "Тренировка сегодня"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let trainingLabel: UILabel = {
        let label = UILabel()
        label.text = "Нет тренировки"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionTrainingLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажните на кнопку Добавить"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userPhotoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noName")
        imageView.backgroundColor = .backgroundUserPhoto
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundCalendar: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.backgroundCalendarColor
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundPluginWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.backgroundWeatherColor
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imagePluginWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageWeather")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let peopleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "people")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    //
    lazy var addWorkButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Добавить"
        configuration.image = UIImage (systemName: "plus")
        configuration.imagePlacement = .top
        configuration.imagePadding = 10
        configuration.baseBackgroundColor = .backgroundAddWork
        configuration.baseForegroundColor = .plusAddWorkButton
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        userPhotoImage.layer.cornerRadius = userPhotoImage.frame.height/2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.backgroundMainViewController
        view.addSubview(backgroundCalendar)
        view.addSubview(userPhotoImage)
        view.addSubview(userLabel)
        view.addSubview(backgroundPluginWeather)
        view.addSubview(weatherLabel)
        view.addSubview(descriptionWeatherLabel)
        view.addSubview(imagePluginWeather)
        view.addSubview(addWorkButton)
        view.addSubview(workoutTodayLabel)
        view.addSubview(peopleImage)
        view.addSubview(trainingLabel)
        view.addSubview(descriptionTrainingLabel)
    }
}
extension MainViewController{
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            userPhotoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            userPhotoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            userPhotoImage.widthAnchor.constraint(equalToConstant: 100),
            userPhotoImage.heightAnchor.constraint(equalToConstant: 100),
            
            userLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 31),
            userLabel.leadingAnchor.constraint(equalTo: userPhotoImage.trailingAnchor, constant: 6),
            userLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            backgroundCalendar.topAnchor.constraint(equalTo: userPhotoImage.topAnchor, constant: 50),
            backgroundCalendar.leadingAnchor.constraint(equalTo: userPhotoImage.leadingAnchor, constant: 0),
            backgroundCalendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            backgroundCalendar.heightAnchor.constraint(equalToConstant: 69),
            
            addWorkButton.topAnchor.constraint(equalTo: backgroundCalendar.bottomAnchor, constant: 9),
            addWorkButton.trailingAnchor.constraint(equalTo: backgroundCalendar.trailingAnchor, constant: 0),
            addWorkButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkButton.widthAnchor.constraint(equalToConstant: 80),
            
            backgroundPluginWeather.topAnchor.constraint(equalTo: backgroundCalendar.bottomAnchor, constant: 9),
            backgroundPluginWeather.leadingAnchor.constraint(equalTo: backgroundCalendar.leadingAnchor, constant: 0),
            backgroundPluginWeather.trailingAnchor.constraint(equalTo: addWorkButton.leadingAnchor, constant: -9),
            backgroundPluginWeather.heightAnchor.constraint(equalToConstant: 80),
            
            imagePluginWeather.topAnchor.constraint(equalTo: backgroundPluginWeather.topAnchor, constant: 9),
            imagePluginWeather.leadingAnchor.constraint(equalTo: backgroundPluginWeather.leadingAnchor, constant: 13),
            imagePluginWeather.heightAnchor.constraint(equalToConstant: 62),
            imagePluginWeather.widthAnchor.constraint(equalToConstant: 62),
            
            weatherLabel.topAnchor.constraint(equalTo: backgroundPluginWeather.topAnchor, constant: 9),
            weatherLabel.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 61),
            weatherLabel.heightAnchor.constraint(equalToConstant: 21),
            
            descriptionWeatherLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 1),
            descriptionWeatherLabel.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 1),
            descriptionWeatherLabel.bottomAnchor.constraint(equalTo: backgroundPluginWeather.bottomAnchor, constant: -1),
            
            workoutTodayLabel.topAnchor.constraint(equalTo: backgroundPluginWeather.bottomAnchor, constant: 11),
            workoutTodayLabel.leadingAnchor.constraint(equalTo: backgroundPluginWeather.leadingAnchor, constant: 0),
            
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
            descriptionTrainingLabel.heightAnchor.constraint(equalToConstant: 21),
        ])
    }
}
