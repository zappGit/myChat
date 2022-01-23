//
//  MainTopbarController.swift
//  myChat
//
//  Created by Артем Хребтов on 23.01.2022.
//

import Foundation
import UIKit

class MainTopBArController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBar.backgroundColor = .mainGrey()
        tabBar.tintColor = .purple
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfiguration)
        let chatImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfiguration)
        let listViewController = ListViewController()
        let peopleViewController = PeopleViewController()
        
        viewControllers = [generateNavigatinController(rootViewController: listViewController, title: "Conversation", image: chatImage!),
                           generateNavigatinController(rootViewController: peopleViewController, title: "People", image: peopleImage!)]
    }
    private func generateNavigatinController(rootViewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: rootViewController)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = image
        return navVC
    }
}
