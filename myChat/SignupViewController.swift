//
//  SignupViewController.swift
//  myChat
//
//  Created by Артем Хребтов on 17.01.2022.
//

import Foundation
import UIKit

class SignupViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Good to see you", font: .avenir26())
    let emailLabel = UILabel(text: "Email", font: .avenir20())
    let passwordLabel = UILabel(text: "Password", font: .avenir20())
    let confirmPasswordLabel = UILabel(text: "Confirm password", font: .avenir20())
    let alreadyOnBoardLabel = UILabel(text: "Already onboard?", font: .avenir20())
    
    let emailTextField = OneLineTextfield(font: .avenir20())
    let passwordTextField = OneLineTextfield(font: .avenir20())
    let confirmPasswordTextField = OneLineTextfield(font: .avenir20())
    
    let signUpButton = UIButton(backgroundColor: .mainBlack(), titleColor: .white, title: "Sign up", cornerRadius: 4)
    let loginButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .avenir20()
        loginButton.setTitleColor(.buttonRed(), for: .normal)
        
        setupConstraints()
    }
}
//MARK: Setup Constraints
extension SignupViewController {
    private func setupConstraints() {
        let emailStackView = UIStackView(arrangeSubviews: [emailLabel, emailTextField], axis: .vertical, spasing: 0)
        let passwordStackView = UIStackView(arrangeSubviews: [passwordLabel, passwordTextField], axis: .vertical, spasing: 0)
        let confirmPasswordStackView = UIStackView(arrangeSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spasing: 0)
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangeSubviews: [emailStackView,
                                                      passwordStackView,
                                                      confirmPasswordStackView,
                                                      signUpButton
                                                     ], axis: .vertical, spasing: 40)
        loginButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangeSubviews: [alreadyOnBoardLabel,
                                                            loginButton
                                                           ], axis: .horizontal,
                                                            spasing: 10)
        bottomStackView.alignment = .firstBaseline
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 140),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
}

//MARK: SwiftUI
import SwiftUI

struct SignupProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SignupViewController()
        
        func makeUIViewController(context: Context) -> SignupViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
