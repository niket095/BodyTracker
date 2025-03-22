//
//  UIFont + Extension.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 28.01.2025.
//

import UIKit

extension UIFont{
    //Roboto
    static func robotoRegular(size: CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func robotoBold(size: CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
