//
//  SetupProfileViewController.swift
//  myChat
//
//  Created by Артем Хребтов on 21.01.2022.
//

import Foundation
import UIKit

class SetupProfileViewController: UIViewController {
    
    let fullImageView = AddPhotoView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        view.backgroundColor = .white
        setupConstrains()
    }
}
extension SetupProfileViewController {
    private func setupConstrains() {
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fullImageView)
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
//MARK: SwiftUI
import SwiftUI

struct SetupProfileProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> SetupProfileViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

