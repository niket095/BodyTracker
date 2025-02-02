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
    
    private let userPhotoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noName")
        imageView.backgroundColor = .backgroundUserPhoto
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundCalendar: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.backgroundCalendarColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundPluginWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.backgroundWeatherColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelWeather: UILabel = {
        let label = UILabel()
        label.text = "Погода"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionWeather: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imagePluginWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageWeather")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundPluginAddWork: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.backgroundAddWork
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelWorkoutToday: UILabel = {
        let label = UILabel()
        label.text = "Тренировка сегодня"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let peopleMainViewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "people")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        
        
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.bacgroundMainViewController
        
        
        view.addSubview(backgroundCalendar)
        view.addSubview(userPhotoImage)
        view.addSubview(userLabel)
        view.addSubview(backgroundPluginWeather)
        view.addSubview(labelWeather)
        view.addSubview(descriptionWeather)
        view.addSubview(imagePluginWeather)
        view.addSubview(backgroundPluginAddWork)
        view.addSubview(labelWorkoutToday)
        view.addSubview(peopleMainViewImage)
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
            
            backgroundPluginAddWork.topAnchor.constraint(equalTo: backgroundCalendar.bottomAnchor, constant: 9),
            backgroundPluginAddWork.trailingAnchor.constraint(equalTo: backgroundCalendar.trailingAnchor, constant: 0),
            backgroundPluginAddWork.heightAnchor.constraint(equalToConstant: 80),
            backgroundPluginAddWork.widthAnchor.constraint(equalToConstant: 80),
            
            backgroundPluginWeather.topAnchor.constraint(equalTo: backgroundCalendar.bottomAnchor, constant: 9),
            backgroundPluginWeather.leadingAnchor.constraint(equalTo: backgroundCalendar.leadingAnchor, constant: 0),
            backgroundPluginWeather.trailingAnchor.constraint(equalTo: backgroundPluginAddWork.leadingAnchor, constant: 9),
            backgroundPluginWeather.heightAnchor.constraint(equalToConstant: 80),
            
            imagePluginWeather.topAnchor.constraint(equalTo: backgroundPluginWeather.topAnchor, constant: 9),
            imagePluginWeather.leadingAnchor.constraint(equalTo: backgroundPluginWeather.leadingAnchor, constant: 13),
            imagePluginWeather.heightAnchor.constraint(equalToConstant: 62),
            imagePluginWeather.widthAnchor.constraint(equalToConstant: 62),
            
            labelWeather.topAnchor.constraint(equalTo: backgroundPluginWeather.topAnchor, constant: 9),
            labelWeather.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 61),
            labelWeather.heightAnchor.constraint(equalToConstant: 21),
            
            descriptionWeather.topAnchor.constraint(equalTo: labelWeather.bottomAnchor, constant: 1),
            descriptionWeather.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 1),
            descriptionWeather.bottomAnchor.constraint(equalTo: backgroundPluginWeather.bottomAnchor, constant: -1),
            
            labelWorkoutToday.topAnchor.constraint(equalTo: backgroundPluginWeather.bottomAnchor, constant: 11),
            labelWorkoutToday.leadingAnchor.constraint(equalTo: backgroundPluginWeather.leadingAnchor, constant: 0),
            
            peopleMainViewImage.topAnchor.constraint(equalTo: labelWorkoutToday.bottomAnchor, constant: 24),
            peopleMainViewImage.leadingAnchor.constraint(equalTo: labelWorkoutToday.leadingAnchor, constant: 55),
            peopleMainViewImage.heightAnchor.constraint(equalToConstant: 300),
            peopleMainViewImage.widthAnchor.constraint(equalToConstant: 251),
            
            
            
            
            
        ])
    }
}
