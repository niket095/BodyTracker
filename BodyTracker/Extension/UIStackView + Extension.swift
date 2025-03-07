//
//  UIStackView + Extension.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 07.03.2025.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


