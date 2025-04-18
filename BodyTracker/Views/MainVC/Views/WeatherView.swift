//
//  WeatherView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 14.02.2025.
//

import UIKit

class WeatherView: UIView {
    
    //MARK: - UI Elemetns
     let imagePluginWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .imageWeather)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "25 C"
        label.textColor = UIColor.specialGray
        label.font = UIFont.robotoBold(size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Погода"
        label.textColor = UIColor.specialGray
        label.font = UIFont.robotoBold(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let descriptionWeatherLabel: UILabel = {
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
        addSubview(tempLabel)
    }
    
    public func setupWeather(temp: String, weather: String, descriptionWeather: String) {
        tempLabel.text = temp
        weatherLabel.text = weather
        descriptionWeatherLabel.text =  descriptionWeather
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
            
            tempLabel.topAnchor.constraint(equalTo: imagePluginWeather.topAnchor, constant: 0),
            tempLabel.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 5),
            tempLabel.trailingAnchor.constraint(equalTo: weatherLabel.leadingAnchor, constant: -5),
           
            
            descriptionWeatherLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 1),
            descriptionWeatherLabel.leadingAnchor.constraint(equalTo: imagePluginWeather.trailingAnchor, constant: 14),
            descriptionWeatherLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            descriptionWeatherLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1)
        ])
    }
}
