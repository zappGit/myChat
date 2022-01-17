//
//  ViewController.swift
//  myChat
//
//  Created by Артем Хребтов on 14.01.2022.
//

import UIKit

class AuthViewController: UIViewController {

    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let emailLabel = UILabel(text: "or sign up with")
    let googleLabel = UILabel(text: "Get startes with")
    let loginLabel = UILabel(text: "Already onboard?")
    
    let emailButton = UIButton(backgroundColor: .mainBlack(),
                               titleColor: .white,
                               title: "Email",
                               font: .avanir20(),
                               isShadow: false,
                               cornerRadius: 4)
    let loginButton = UIButton(backgroundColor: .white,
                               titleColor: .buttonRed(),
                               title: "Login",
                               font: .avanir20(),
                               isShadow: true,
                               cornerRadius: 4)
    let googleButton = UIButton(backgroundColor: .white,
                                titleColor: .black,
                                title: "Google",
                                font: .avanir20(),
                                isShadow: true,
                                cornerRadius: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
    }
}
//MARK: SwiftUI
import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
