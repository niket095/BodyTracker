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
    
     let workoutImage: UIImageView = {
        let imageView = UIImageView()
      //  imageView.image = UIImage(resource: .no)
        imageView.layer.cornerRadius = Constants.radiusCorner
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
      //  imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    //    setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        workoutImage.frame = bounds
        addSubview(workoutImage)
    }
    
    
    public func setupModel(model: CollectionImageWorkoutModel) {
        //  nameWorkoutLabel.text = model.name
        workoutImage.image = UIImage(named: model.image)
     }
}
