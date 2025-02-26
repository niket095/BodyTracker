//
//  WeatherView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 14.02.2025.
//

import UIKit

class WeatherView: UIView {
    
    private let backgroundPluginWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.backgroundWeatherColor
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imagePluginWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Resources.weatherImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Погода"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoBold(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = "good weather to exercise outside, do not forget to bring water with you"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
        setConstraints()
        addShadowOnView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {

        addSubview(backgroundPluginWeather)
        addSubview(weatherLabel)
        addSubview(descriptionWeatherLabel)
        addSubview(imagePluginWeather)
    }
}

extension WeatherView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundPluginWeather.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundPluginWeather.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundPluginWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundPluginWeather.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            imagePluginWeather.topAnchor.constraint(equalTo: backgroundPluginWeather.topAnchor, constant: 9),
            imagePluginWeather.leadingAnchor.constraint(equalTo: backgroundPluginWeather.leadingAnchor, constant: 13),
            imagePluginWeather.heightAnchor.constraint(equalToConstant: 62),
            imagePluginWeather.widthAnchor.constraint(equalToConstant: 62),
            
            weatherLabel.topAnchor.constraint(equalTo: backgroundPluginWeather.topAnchor, constant: 9),
            weatherLabel.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 61),
            weatherLabel.heightAnchor.constraint(equalToConstant: 21),
            
            descriptionWeatherLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 1),
            descriptionWeatherLabel.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 1),
            descriptionWeatherLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1),
            descriptionWeatherLabel.bottomAnchor.constraint(equalTo: backgroundPluginWeather.bottomAnchor, constant: -1),
        ])
    }
}
