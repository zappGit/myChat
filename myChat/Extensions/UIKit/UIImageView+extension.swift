//
//  UIImageView+extension.swift
//  myChat
//
//  Created by Артем Хребтов on 17.01.2022.
//

import Foundation
import UIKit

extension UIImageView {
    convenience init (image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
