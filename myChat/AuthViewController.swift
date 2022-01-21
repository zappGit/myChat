//
//  ViewController.swift
//  myChat
//
//  Created by Артем Хребтов on 14.01.2022.
//

import UIKit

class AuthViewController: UIViewController {

    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let emailLabel = UILabel(text: "Or sign up with")
    let googleLabel = UILabel(text: "Get startes with")
    let loginLabel = UILabel(text: "Already onboard?")
    
    let emailButton = UIButton(backgroundColor: .mainBlack(),
                               titleColor: .white,
                               title: "Email",
                               font: .avenir20(),
                               isShadow: false,
                               cornerRadius: 4)
    let loginButton = UIButton(backgroundColor: .white,
                               titleColor: .buttonRed(),
                               title: "Login",
                               font: .avenir20(),
                               isShadow: true,
                               cornerRadius: 4)
    let googleButton = UIButton(backgroundColor: .white,
                                titleColor: .black,
                                title: "Google",
                                font: .avenir20(),
                                isShadow: true,
                                cornerRadius: 4)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        googleButton.customizeGoogleButton()
        setupConstraints()
    }
}

extension AuthViewController {
    private func setupConstraints() {
       
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: loginLabel, button: loginButton)
        
        let stackView = UIStackView(arrangeSubviews: [googleView, emailView, loginView], axis: .vertical, spasing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
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
