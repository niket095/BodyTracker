//
//  UIView + Extension.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 17.02.2025.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.masksToBounds = false
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowRadius = 1.0
    }
}
