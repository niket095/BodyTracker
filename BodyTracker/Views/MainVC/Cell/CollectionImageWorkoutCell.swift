//
//  CollectionImageWorkoutCell.swift
//  BodyTracker
//
//  Created by Никита on 23.04.2025.
//
//

import UIKit

class CollectionImageWorkoutCell: UICollectionViewCell {
    static let cellID = "CollectionImageWorkoutCell"
    
    private let workoutImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .no)
        imageView.layer.cornerRadius = Constants.radiusCorner
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.specialGray
        label.font = UIFont.robotoRegular(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        
        addSubview(workoutImage)
        addSubview(nameWorkoutLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            workoutImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            workoutImage.heightAnchor.constraint(equalToConstant: 100),
            workoutImage.widthAnchor.constraint(equalToConstant: 100),
            
            nameWorkoutLabel.topAnchor.constraint(equalTo: workoutImage.bottomAnchor, constant: 5),
            nameWorkoutLabel.leadingAnchor.constraint(equalTo: workoutImage.trailingAnchor, constant: 0),
            nameWorkoutLabel.trailingAnchor.constraint(equalTo: workoutImage.trailingAnchor, constant: 0),
        ])
    }
    
    public func setupModel(model: CollectionImageWorkoutModel) {
        nameWorkoutLabel.text = model.name
        workoutImage.image = UIImage(named: model.image)
     }
}
