//
//  CalendarView.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 14.02.2025.
//

import UIKit

class CalendarView: UIView {
    
    private let backgroundCalendar: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.backgroundCalendarColor
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupCollection()
        setConstraints()
        addShadowOnView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundCalendar)
        addSubview(calendarCollectionView)
    }
    
    private func setupCollection() {
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.cellID)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCalendar.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundCalendar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundCalendar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundCalendar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            calendarCollectionView.topAnchor.constraint(equalTo: backgroundCalendar.topAnchor, constant: 5),
            calendarCollectionView.bottomAnchor.constraint(equalTo: backgroundCalendar.bottomAnchor, constant: -5),
            calendarCollectionView.trailingAnchor.constraint(equalTo: backgroundCalendar.trailingAnchor, constant: -10),
            calendarCollectionView.leadingAnchor.constraint(equalTo: backgroundCalendar.leadingAnchor, constant: 100)
        ])
    }
}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.cellID, for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        
        let dateTimeZone = Date().localeDate()
        print("дата:", dateTimeZone)
        let weekArray = dateTimeZone.getWeekArray()
        print("weekArray:", weekArray)
        
        cell.cellConfigure(numberOfDay: weekArray[1][indexPath.item], dayOfWeek: weekArray[0][indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 34, height: 59)
    }
}
