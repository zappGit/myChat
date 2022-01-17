//
//  UIButton+Extension.swift
//  myChat
//
//  Created by Артем Хребтов on 16.01.2022.
//

import Foundation
import UIKit

extension UIButton {
    convenience init (backgroundColor: UIColor,
                      titleColor: UIColor,
                      title: String,
                      font: UIFont? = .avanir20(),
                      isShadow: Bool,
                      cornerRadius: CGFloat = 4) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
}

