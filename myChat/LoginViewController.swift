//
//  LoginViewController.swift
//  myChat
//
//  Created by Артем Хребтов on 19.01.2022.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Welcome back", font: .avenir26())
    
    let loginWithLabel = UILabel(text: "Login with", font: .avenir20())
    let orLabel = UILabel(text: "or", font: .avenir20())
    let emailLabel = UILabel(text: "Email", font: .avenir20())
    let passwordLabel = UILabel(text: "Password", font: .avenir20())
    let accountLabel = UILabel(text: "Need an account?", font: .avenir20())
    
    let googleButton = UIButton(backgroundColor: .white,
                                titleColor: .black,
                                title: "Google",
                                font: .avenir20(),
                                isShadow: true,
                                cornerRadius: 4)
    
    let emailTextField = OneLineTextfield(font: .avenir20())
    let passwordTextField = OneLineTextfield(font: .avenir20())
    
    let loginButton = UIButton(backgroundColor: .mainBlack(),
                                titleColor: .white,
                                title: "Login",
                                font: .avenir20(),
                                isShadow: false,
                                cornerRadius: 4)
    let signInButton: UIButton = {
       let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .avenir20()
        button.setTitleColor(.buttonRed(), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        googleButton.customizeGoogleButton()
        setupConstraints()
    }
    //MARK: Constrains
    private func setupConstraints() {
        let loginWithView = ButtonFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(arrangeSubviews: [emailLabel, emailTextField],
                                         axis: .vertical,
                                         spasing: 0)
        let passwordStackView = UIStackView(arrangeSubviews: [passwordLabel, passwordTextField],
                                           axis: .vertical,
                                           spasing: 0)
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangeSubviews: [loginWithView,
                                                      orLabel,
                                                      emailStackView,
                                                      passwordStackView,
                                                      loginButton],
                                    axis: .vertical,
                                    spasing: 40)
        signInButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangeSubviews: [accountLabel, signInButton],
                                          axis: .horizontal,
                                          spasing: 10)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
}

//MARK: SwiftUI
import SwiftUI

struct LoginProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = LoginViewController()
        
        func makeUIViewController(context: Context) -> LoginViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
