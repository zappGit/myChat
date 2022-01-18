//
//  UIStackView+extension.swift
//  myChat
//
//  Created by Артем Хребтов on 17.01.2022.
//

import Foundation
import UIKit

extension UIStackView {
    
    convenience init(arrangeSubviews: [UIView], axis: NSLayoutConstraint.Axis, spasing: CGFloat) {
        self.init(arrangedSubviews: arrangeSubviews)
        self.axis = axis
        self.spacing = spasing
    }
}
