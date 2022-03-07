//
//  SectionHeader.swift
//  myChat
//
//  Created by Артем Хребтов on 18.02.2022.
//

import Foundation
import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseID = "SectionHeader"
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func config(text: String, font: UIFont?, textColor: UIColor) {
        title.textColor = textColor
        title.text = text
        title.font = font
    }
}
