//
//  RepsOrTimerView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 03.03.2025.
//
//

import UIKit

protocol RepsOrTimerViewDelegate: AnyObject {
    func selectImageButtonTapped()
}

class RepsOrTimerView: UIView {
    
    weak var repsOrTimerViewDelegate: WorkoutTableViewCellDelegate?
    
    private enum LabelState {
        case active
        case negative
    }
    
    //MARK: - UI Elements
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
    
    private let selectionPictureLabel = UILabel(text: "Выберите картинку:",
                                                color: .specialGray,
                                                font: UIFont.robotoRegular(size: 18),
                                                alignment: .center)
    
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
    
    private let selectImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var trainingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .no)
        imageView.layer.cornerRadius = Constants.radiusCorner
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var setsStackView = UIStackView()
    private var sliderStackView = UIStackView()
    private var repsStackView = UIStackView()
    private var timerStackView = UIStackView()
    private var imageStackView = UIStackView()
    
    
    
    //MARK: - Life cicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
        setupView()
        setConstraints()
        addShadowOnView()
        
       // collectionVC.collectionDelegate = self
     //   setTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView(image: UIImage) {
        trainingImageView.image = image
    }
    
    //MARK: - Setup stack
    private func setupStackView() {
        setsStackView = UIStackView(arrangedSubviews: [setsLabel,
                                                       setsNumberLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        
        sliderStackView =  UIStackView(arrangedSubviews: [setsStackView,
                                                          setsSlider],
                                       axis: .vertical,
                                       spacing: 5)
      
        
        repsStackView = UIStackView(arrangedSubviews: [repsLabel,
                                                       repsNumberLabel],
                                    axis: .horizontal,
                                    spacing: 10)
       
        
        timerStackView = UIStackView(arrangedSubviews: [timerLabel,
                                                        timerNumberLabel],
                                     axis: .horizontal,
                                     spacing: 10)
       
        
        imageStackView = UIStackView(arrangedSubviews: [selectionPictureLabel,
                                                        selectImageButton],
                                     axis: .vertical,
                                     spacing: 5)
        
      //  addSubview(selectionPictureLabel)
      //  addSubview(selectImage)
    }
    
    private func setupView() {
        
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialDirtyWhite
        layer.cornerRadius = Constants.radiusCorner
        
        addSubview(sliderStackView)
        addSubview(chooseRepeatOrtimer)
        addSubview(repsStackView)
        addSubview(repsSlider)
        addSubview(timerStackView)
        addSubview(timerSlider)
        addSubview(imageStackView)
        addSubview(trainingImageView)
        
        repsSlider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        setsSlider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        timerSlider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
        selectImageButton.addTarget(self, action: #selector(selectImageButtonTapped), for: .touchUpInside)
    }
    
    private func setActive(nameLabel: UILabel, numberLabel: UILabel, slider: UISlider) {
        nameLabel.alpha = 1
        numberLabel.alpha = 1
        slider.alpha = 1
    }
    private func setNegative(nameLabel: UILabel, numberLabel: UILabel, slider: UISlider) {
        nameLabel.alpha = 0.5
        numberLabel.alpha = 0.5
        slider.alpha = 0.5
    }
}

extension RepsOrTimerView {
    
    //MARK: - Targets
    
    @objc private func selectImageButtonTapped() {
        repsOrTimerViewDelegate?.actionOfStartButton()
        
    }

    //MARK: - Extension - Setup Slider
    @objc private func repsSliderChanged(sender: UISlider) {
        repsNumberLabel.text = "\(Int(sender.value))"
        
        setState(nameLabel: repsLabel, numberLabel: repsNumberLabel, slider: repsSlider, state: .active)
        setState(nameLabel: timerLabel, numberLabel: timerNumberLabel, slider: timerSlider, state: .negative)
    }
    
    @objc private func setsSliderChanged(sender: UISlider) {
        setsNumberLabel.text = "\(Int(sender.value))"
    }
    
    @objc private func timerSliderChanged(sender: UISlider) {
        
        let totalSeconds = Int(sender.value)
        let (min, sec) = (totalSeconds / 60, totalSeconds % 60)
        
        if sec != 0 {
            timerNumberLabel.text = "\(min) мин \(sec) сек"
        } else {
            timerNumberLabel.text = "\(min) мин"
        }
        
        setState(nameLabel: timerLabel, numberLabel: timerNumberLabel, slider: timerSlider, state: .active)
        setState(nameLabel: repsLabel, numberLabel: repsNumberLabel, slider: repsSlider, state: .negative)
        
    }
    
    private func setState(nameLabel: UILabel, numberLabel: UILabel, slider: UISlider, state: LabelState) {
        switch state {
        case .active:
            nameLabel.alpha = 1
            numberLabel.alpha = 1
            slider.alpha = 1
        case .negative:
            nameLabel.alpha = 0.5
            numberLabel.alpha = 0.5
            slider.alpha = 0.5
            slider.value = 0.0
            numberLabel.text = (numberLabel == timerNumberLabel) ? "0 мин" :  "0"
        }
    }
    
    
    
    //MARK: - Constraints
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
                       
            trainingImageView.topAnchor.constraint(equalTo: timerSlider.bottomAnchor, constant: 50),
            trainingImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            trainingImageView.heightAnchor.constraint(equalToConstant: 150),
            trainingImageView.widthAnchor.constraint(equalToConstant: 150),
            
            selectImageButton.heightAnchor.constraint(equalToConstant: 100),
            
            imageStackView.topAnchor.constraint(equalTo: timerSlider.bottomAnchor, constant: 10),
            imageStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 52),
            imageStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -52),
            imageStackView.heightAnchor.constraint(equalToConstant: 150),
            
          
        ])
    }
}

