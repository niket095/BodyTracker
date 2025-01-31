//
//  ViewController.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 21.01.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    private let userLabel: UILabel = {
        let label = UILabel()
        label.text = "New User"
        label.textColor = UIColor.userLabelColor
        label.font = UIFont.robotoRegular(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userPhotoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noName")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let backgroundUserPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundUserPhoto")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundCalendar: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.backgroundCalendarColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .red
    }


}

