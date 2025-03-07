//
//  RepsOrTimerView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 03.03.2025.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let setsLabel = UILabel(text: "Шаги",
                                    color: .specialGray,
                                    font: UIFont.robotoRegular(size: 18),
                                    alignment: .left)
    
    private let numberSetsLabel = UILabel(text: "0",
                                          color: .specialGray,
                                          font: UIFont.robotoRegular(size: 24),
                                          alignment: .left)
    
    private let chooseRepeatOrtimer = UILabel(text: "Повтор или таймер",
                                              color: .specialBeige,
                                              font: UIFont.robotoRegular(size: 14),
                                              alignment: .left)
    
    private let repsLabel = UILabel(text: "Повторы",
                                    color: .specialGray,
                                    font: UIFont.robotoRegular(size: 18),
                                    alignment: .left)
    
    private let numberRepsLabel = UILabel(text: "0",
                                          color: .specialGray,
                                          font: UIFont.robotoRegular(size: 24),
                                          alignment: .left)
    
    private let timerLabel = UILabel(text: "Таймер",
                                     color: .specialGray,
                                     font: UIFont.robotoRegular(size: 18),
                                     alignment: .left)
    
    private let numberTimerLabel = UILabel(text: "0 мин",
                                          color: .specialGray,
                                          font: UIFont.robotoRegular(size: 24),
                                          alignment: .left)
    
    private let sliderSets: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialBeige
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let sliderReps: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 50
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialBeige
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let sliderTimer: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 600
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialBeige
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
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
        backgroundColor = .specialDirtyWhite
        
        addSubview(setsLabel)
        addSubview(numberSetsLabel)
        addSubview(sliderSets)
        addSubview(chooseRepeatOrtimer)
        addSubview(repsLabel)
        addSubview(numberRepsLabel)
        addSubview(sliderReps)
        addSubview(timerLabel)
        addSubview(numberTimerLabel)
        addSubview(sliderTimer)
    }
}
    
extension RepsOrTimerView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            setsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            setsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            setsLabel.heightAnchor.constraint(equalToConstant: 21),
            
            numberSetsLabel.topAnchor.constraint(equalTo: setsLabel.topAnchor, constant: 0),
            numberSetsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            numberSetsLabel.heightAnchor.constraint(equalToConstant: 28),
            
            sliderSets.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 10),
            sliderSets.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sliderSets.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            chooseRepeatOrtimer.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 52),
            chooseRepeatOrtimer.centerXAnchor.constraint(equalTo: centerXAnchor),
            chooseRepeatOrtimer.heightAnchor.constraint(equalToConstant: 20),
            
            repsLabel.topAnchor.constraint(equalTo: chooseRepeatOrtimer.bottomAnchor, constant: 5),
            repsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            repsLabel.heightAnchor.constraint(equalToConstant: 21),
            
            numberRepsLabel.topAnchor.constraint(equalTo: repsLabel.topAnchor, constant: 0),
            numberRepsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            numberRepsLabel.heightAnchor.constraint(equalToConstant: 28),
            
            sliderReps.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 10),
            sliderReps.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sliderReps.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            timerLabel.topAnchor.constraint(equalTo: sliderReps.bottomAnchor, constant: 14),
            timerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            timerLabel.heightAnchor.constraint(equalToConstant: 21),
            
            numberTimerLabel.topAnchor.constraint(equalTo: timerLabel.topAnchor, constant: 0),
            numberTimerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            numberTimerLabel.heightAnchor.constraint(equalToConstant: 28),
            
            sliderTimer.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10),
            sliderTimer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sliderTimer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
