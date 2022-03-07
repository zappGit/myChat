//
//  ActiveChatCell.swift
//  myChat
//
//  Created by Артем Хребтов on 14.02.2022.
//

import Foundation
import UIKit

protocol ConfiguringCell {
    static var reuseID: String {get}
    func configure<U: Hashable>(with value: U)
}

class ActiveChatCell: UICollectionViewCell, ConfiguringCell {
   
    func configure<U: Hashable>(with value: U) {
        guard let chat: MyChat = value as? MyChat else { return }
        friendImageView.image = UIImage(named: chat.userImageString)
        friendLabel.text = chat.username
        lastMessage.text = chat.lastMessage
    }
    
    
    static var reuseID: String = "activeChatCell"
    
    let friendImageView = UIImageView()
    let friendLabel = UILabel(text: "User name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "LOL", font: .laoSangamMN18())
    let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.8309458494, green: 0.7057176232, blue: 0.9536159635, alpha: 1), endColor:  #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        friendLabel.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        
//        gradientView.backgroundColor = .black
        
        
        addSubview(friendImageView)
        addSubview(gradientView)
        addSubview(friendLabel)
        addSubview(lastMessage)
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
        NSLayoutConstraint.activate([
            friendLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            friendLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16),
            friendLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            lastMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16),
            lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16)
        ])
    }
    
}

import SwiftUI
struct ActiveChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = MainTopBArController()
        
        func makeUIViewController(context: Context) -> MainTopBArController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
