//
//  WeatherView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 14.02.2025.
//

import UIKit

class WeatherView: UIView {
    
    //MARK: - UI Elemetns
    private let imagePluginWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .imageWeather)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Погода"
        label.textColor = UIColor.specialGray
        label.font = UIFont.robotoBold(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = "good weather to exercise outside, do not forget to bring water with you"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.specialGray
        label.font = UIFont.robotoRegular(size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life cicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
        addShadowOnView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialWhite
        layer.cornerRadius = Constants.radiusCorner
        
        addSubview(weatherLabel)
        addSubview(descriptionWeatherLabel)
        addSubview(imagePluginWeather)
    }
}

//MARK: - Constraints
extension WeatherView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imagePluginWeather.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            imagePluginWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            imagePluginWeather.heightAnchor.constraint(equalToConstant: 62),
            imagePluginWeather.widthAnchor.constraint(equalToConstant: 62),
            
            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            weatherLabel.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 61),
            weatherLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -61),
            weatherLabel.heightAnchor.constraint(equalToConstant: 21),
            
            descriptionWeatherLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 1),
            descriptionWeatherLabel.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 14),
            descriptionWeatherLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            descriptionWeatherLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1)
        ])
    }
}
