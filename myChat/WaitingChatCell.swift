//
//  WaitingChatCell.swift
//  myChat
//
//  Created by Артем Хребтов on 18.02.2022.
//

import Foundation
import UIKit

class WaitingChatCell: UICollectionViewCell, ConfiguringCell {
    static var reuseID: String = "WaitingChatCell"
    let friendImage = UIImageView()
    
    func configure(with value: MyChat) {
        friendImage.image = UIImage(named: value.userImageString)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        friendImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImage)
        
        NSLayoutConstraint.activate([
            friendImage.topAnchor.constraint(equalTo: self.topAnchor),
            friendImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            friendImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
