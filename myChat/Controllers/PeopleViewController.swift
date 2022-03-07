//
//  PeopleViewController.swift
//  myChat
//
//  Created by Артем Хребтов on 23.01.2022.
//

import Foundation
import UIKit

class PeopleViewController: UIViewController {
    
    let users = Bundle.main.decode(with: [MyUser].self, from: "users.json")
    var collectionView: UICollectionView!
    var dataSourse: UICollectionViewDiffableDataSource<Section, MyUser>!
    
    enum Section: Int, CaseIterable {
        case users
        func description(userCount: Int) -> String {
            switch self {
            case .users:
                return "\(userCount) people nearby"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setupCollectionView()
        createDatasourse()
        reloadData()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    private func setupCollectionView() {
        // через compositionalLayout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.backgroundColor = .mainWhite()
        //header
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseID)
        //cell
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseID)
    }
    private func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, MyUser>()
        snapShot.appendSections([.users])
        snapShot.appendItems(users, toSection: .users)
        dataSourse?.apply(snapShot, animatingDifferences: true, completion: nil)
    }
}

extension PeopleViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
 
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { section, layoutEnviropment in
            guard let section = Section(rawValue: section) else {
                fatalError("Cannot find/create section")
            }
            
            switch section {
            case .users:
                return self.createUserSection()
            }
            
        }, configuration: config)
        
        return layout
    }
    
    private func createUserSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(0.6))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        group.interItemSpacing = .fixed(20)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
       //header
        let sectionHeader = createHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        return sectionHeader
    }
}
//MARK: Data Sourse
extension PeopleViewController {
    private func createDatasourse() {
        dataSourse = UICollectionViewDiffableDataSource<Section, MyUser>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("No section in this castle, Mario")
            }
            switch section {
            case .users:
                return self.configure(collectionView: collectionView, cellType: UserCell.self, with: itemIdentifier, for: indexPath)
            }
        })
        dataSourse?.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseID, for: indexPath) as? SectionHeader else {
                fatalError("Cannot create section header")
            }
            guard let section = Section(rawValue: indexPath.section) else { fatalError("No section") }
            let items = self.dataSourse.snapshot().itemIdentifiers(inSection: .users)
            sectionHeader.config(text: section.description(userCount: items.count),
                                 font: .systemFont(ofSize: 36, weight: .light),
                                 textColor: .label)
            
            return sectionHeader
        }
    }
    
}
//MARK: SwiftUI
import SwiftUI

struct PeopleProvider: PreviewProvider {
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

extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
