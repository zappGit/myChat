//
//  UILabel+extension.swift
//  myChat
//
//  Created by Артем Хребтов on 16.01.2022.
//

import Foundation
import UIKit

extension UILabel {
    convenience init (text: String) {
        self.init()
        self.text = text
    }
}
