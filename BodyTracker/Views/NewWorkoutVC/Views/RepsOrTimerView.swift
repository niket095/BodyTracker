//
//  RepsOrTimerView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 03.03.2025.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let setsLabel = UILabel(text: "Сеты",
                                    color: .specialGray,
                                    font: UIFont.robotoRegular(size: 18),
                                    alignment: .left)
    
    private let setsNumberLabel = UILabel(text: "0",
                                          color: .specialGray,
                                          font: UIFont.robotoRegular(size: 18),
                                          alignment: .left)
    
    private let chooseRepeatOrtimer = UILabel(text: "Повтор или таймер",
                                              color: .specialBeige,
                                              font: UIFont.robotoRegular(size: 14),
                                              alignment: .left)
    
    private let repsLabel = UILabel(text: "Повторы",
                                    color: .specialGray,
                                    font: UIFont.robotoRegular(size: 18),
                                    alignment: .left)
    
    private let repsNumberLabel = UILabel(text: "0",
                                          color: .specialGray,
                                          font: UIFont.robotoRegular(size: 18),
                                          alignment: .left)
    
    private let timerLabel = UILabel(text: "Таймер",
                                     color: .specialGray,
                                     font: UIFont.robotoRegular(size: 18),
                                     alignment: .left)
    
    private let timerNumberLabel = UILabel(text: "0 мин",
                                          color: .specialGray,
                                          font: UIFont.robotoRegular(size: 18),
                                          alignment: .left)
    
    private let setsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialBeige
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let repsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 50
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialBeige
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let timerSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 600
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialBeige
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private var setsStackView = UIStackView()
    private var sliderStackView = UIStackView()
    private var repsStackView = UIStackView()
    private var timerStackView = UIStackView()
    
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
    
    private func setupStackView() {
        setsStackView = UIStackView(arrangedSubviews: [setsLabel,
                                                       setsNumberLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        
        sliderStackView =  UIStackView(arrangedSubviews: [setsStackView,
                                                          setsSlider],
                                       axis: .vertical,
                                       spacing: 5)
        addSubview(sliderStackView)
        addSubview(chooseRepeatOrtimer)
        
        repsStackView = UIStackView(arrangedSubviews: [repsLabel,
                                                         repsNumberLabel],
                                      axis: .horizontal,
                                      spacing: 10)
        
        addSubview(repsStackView)
        addSubview(repsSlider)
        
        timerStackView = UIStackView(arrangedSubviews: [timerLabel,
                                                        timerNumberLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        
        addSubview(timerStackView)
        addSubview(timerSlider)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialDirtyWhite
        layer.cornerRadius = Constants.radiusCorner
        
        repsSlider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        setsSlider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        timerSlider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
    }
}
    
extension RepsOrTimerView {
    @objc private func repsSliderChanged(sender: UISlider) {
        repsNumberLabel.text = "\(Int(sender.value))"
    }
    
    @objc private func setsSliderChanged(sender: UISlider) {
        setsNumberLabel.text = "\(Int(sender.value))"
    }
    
    @objc private func timerSliderChanged(sender: UISlider) {
        let (min, sec) = { (secs: Int) -> (Int, Int) in
            return (secs / 60, secs % 60)} (Int(sender.value))
        
        timerNumberLabel.text = (sec != 0 ? "\(min) мин \(sec) сек" : "\(min) мин")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            sliderStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            sliderStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            sliderStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            
            chooseRepeatOrtimer.topAnchor.constraint(equalTo: sliderStackView.bottomAnchor, constant: 52),
            chooseRepeatOrtimer.centerXAnchor.constraint(equalTo: centerXAnchor),
            chooseRepeatOrtimer.heightAnchor.constraint(equalToConstant: 20),
            
            repsStackView.topAnchor.constraint(equalTo: chooseRepeatOrtimer.bottomAnchor, constant: 10),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            
            
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 5),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 5),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            timerStackView.heightAnchor.constraint(equalToConstant: 21),
            
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 5),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
        ])
    }
}
