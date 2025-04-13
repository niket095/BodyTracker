//
//  WorkoutTableViewCell.swift
//  BodyTracker
//
//  Created by Никита on 03.04.2025.
//

import UIKit

protocol WorkoutTableViewCellDelegate: AnyObject {
    func actionOfStartButton()
}

class WorkoutTableViewCell: UITableViewCell {
    weak var cellWorkoutDelegate: WorkoutTableViewCellDelegate?
    
    static let cellID = "WorkoutTableViewCell"
    
    private let backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.radiusCorner
        view.backgroundColor = .specialDirtyWhite
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .imageWeather)
        imageView.layer.cornerRadius = Constants.radiusCorner
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Отжимания"
        label.textColor = .black
        label.font = UIFont.robotoBold(size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsOrTimerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialGray
        label.font = UIFont.robotoRegular(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialGray
        label.font = UIFont.robotoRegular(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(.specialDarkGreen, for: .normal)
        button.layer.cornerRadius = Constants.radiusCorner
        button.titleLabel?.font = UIFont.robotoBold(size: 16)
        button.backgroundColor = .specialYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var labelStackView = UIStackView()
    private var repsOrTimerCount = 0
    private var setsCount = 0
    
    //MARK: - Life cicle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
        setConstraints()
        setTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func cellConfigure(repsOrTimer: Int, sets: Int) {
        repsOrTimerCount = repsOrTimer
        setsCount = sets
        
        repsOrTimerLabel.text = "Повторения: \(repsOrTimerCount)"
        setsLabel.text = "Сеты: \(setsCount)"
    }
    
    private func setupCell() {
        addShadowOnView()
        backgroundColor = .clear
        layer.cornerRadius = Constants.radiusCorner
        
        labelStackView = UIStackView(arrangedSubviews: [repsOrTimerLabel,
                                                        setsLabel],
                                     axis: .horizontal,
                                     spacing: 5)
        
        addSubview(backgroundCell)
        addSubview(cellImage)
        addSubview(nameLabel)
        addSubview(labelStackView)
        contentView.addSubview(startButton)
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            cellImage.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            cellImage.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 15),
            cellImage.widthAnchor.constraint(equalToConstant: 67),
            cellImage.heightAnchor.constraint(equalToConstant: 67),
            
            nameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 13),
            nameLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -15),
            
            labelStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            labelStackView.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 15),
            labelStackView.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -15),
            
            startButton.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 4),
            startButton.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 15),
            startButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -15),
            startButton.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -12)
        ])
    }
    
    //MARK: - Action
    private func setTarget() {
        startButton.addTarget(self, action: #selector(startWorkout), for: .touchUpInside)
    }
    
    @objc func startWorkout() {
        cellWorkoutDelegate?.actionOfStartButton()
    }
}

