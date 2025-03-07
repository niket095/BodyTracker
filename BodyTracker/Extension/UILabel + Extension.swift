//
//  UILabel + Extension.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 27.02.2025.
//

import UIKit

extension UILabel{
    
    convenience init(text: String, color: UIColor, font: UIFont, alignment: NSTextAlignment) {
        self.init()
        
        self.text = text
        self.textColor = color
        self.font = font
        self.textAlignment = alignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

