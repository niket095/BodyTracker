//
//  RepsOrTimerView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 03.03.2025.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let backgroundRepsOrTimer: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.specialDirtyWhite
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let setsLabel = UILabel(text: "Шаги", color: .specialGray, font: UIFont.robotoRegular(size: 18))
    
    private let chooseRepeatOrtimer = UILabel(text: "Повтор или таймер", color: .specialBeige, font: UIFont.robotoRegular(size: 14))
    
    private let repsLabel = UILabel(text: "Повторы", color: .specialGray, font: UIFont.robotoRegular(size: 18))
    
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
        
        addSubview(backgroundRepsOrTimer)
        addSubview(setsLabel)
        addSubview(chooseRepeatOrtimer)
        addSubview(repsLabel)
    }
}

extension RepsOrTimerView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundRepsOrTimer.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundRepsOrTimer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundRepsOrTimer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundRepsOrTimer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            setsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            setsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            setsLabel.heightAnchor.constraint(equalToConstant: 21),
            
            chooseRepeatOrtimer.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 52),
            chooseRepeatOrtimer.centerXAnchor.constraint(equalTo: centerXAnchor),
            chooseRepeatOrtimer.heightAnchor.constraint(equalToConstant: 20),
            
            repsLabel.topAnchor.constraint(equalTo: chooseRepeatOrtimer.bottomAnchor, constant: 5),
            repsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            repsLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
}
