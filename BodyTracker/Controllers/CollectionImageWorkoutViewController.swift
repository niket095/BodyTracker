//

//  CollectionImageWorkoutViewController.swift
//  BodyTracker
//
//  Created by Никита on 21.04.2025.
//
//

import UIKit

protocol CollectionImageWorkoutViewControllerDelegate: AnyObject {
    func imageTapped(with image: UIImage)
}

class CollectionImageWorkoutViewController: UIViewController {
    
    weak var collectionDelegate: CollectionImageWorkoutViewControllerDelegate?
    
    private let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
       // layout.minimumInteritemSpacing = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.bounces = false
        collectionView.backgroundColor = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupCollection()
        setConstraints()
    }
    
    private func setupView() {
        preferredContentSize = CGSize(width: 300, height: 400)
        view.backgroundColor = .gray
        view.addSubview(imageCollectionView)
    }
    
    private func setupCollection() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        
        imageCollectionView.register(CollectionImageWorkoutCell.self,
                                    forCellWithReuseIdentifier: CollectionImageWorkoutCell.cellID)
       
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension CollectionImageWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionImageWorkoutCell.cellID, for: indexPath) as? CollectionImageWorkoutCell else { return UICollectionViewCell() }
        
        let model = imageArray[indexPath.row]
        cell.setupModel(model: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionImageWorkoutCell
        guard let image = cell?.workoutImage.image else { return }
        
        collectionDelegate?.imageTapped(with: image)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    
}
    

