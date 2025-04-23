//
//  CollectionImageWorkoutViewController.swift
//  BodyTracker
//
//  Created by Никита on 21.04.2025.
//
//

import UIKit

class CollectionImageWorkoutViewController: UIViewController {
    
    private let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
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
            imageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
    
    
}
    

