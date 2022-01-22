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
    let welcomeLabel = UILabel(text: "Setup profile", font: .avenir26())
    let fullNameLabel = UILabel(text: "Login with", font: .avenir20())
    let aboutMeLabel = UILabel(text: "About me", font: .avenir20())
    let sexLabel = UILabel(text: "Sex", font: .avenir20())
    let fullNameTextField = OneLineTextfield(font: .avenir20())
    let aboutMeTextField = OneLineTextfield(font: .avenir20())
    let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    let goToChartButton = UIButton(backgroundColor: .mainBlack(),
                                   titleColor: .white,
                                   title: "Go to charts",
                                   font: .avenir20(),
                                   isShadow: false,
                                   cornerRadius: 4)
    
    override func viewDidLoad() {
        super .viewDidLoad()
        view.backgroundColor = .white
        setupConstrains()
    }
}
extension SetupProfileViewController {
    private func setupConstrains() {
        let fullStackView = UIStackView(arrangeSubviews: [fullNameLabel,
                                                          fullNameTextField],
                                        axis: .vertical,
                                        spasing: 0)
        let aboutMeStackView = UIStackView(arrangeSubviews: [aboutMeLabel, aboutMeTextField],
                                           axis: .vertical,
                                           spasing: 0)
        let sexStackView = UIStackView(arrangeSubviews: [sexLabel, sexSegmentedControl],
                                       axis: .vertical,
                                       spasing: 12)
        goToChartButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangeSubviews: [fullStackView,
                                                      aboutMeStackView,
                                                      sexStackView,
                                                      goToChartButton],
                                    axis: .vertical,
                                    spasing: 40)
        
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fullImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
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

