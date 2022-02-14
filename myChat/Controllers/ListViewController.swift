//
//  ListViewController.swift
//  myChat
//
//  Created by Артем Хребтов on 23.01.2022.
//

import Foundation
import UIKit

struct MyChat: Hashable, Codable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: MyChat, rhs: MyChat) -> Bool {
        return lhs.id == rhs.id
    }
}

class ListViewController: UIViewController {
    var collectionView: UICollectionView!
    let activeChats = Bundle.main.decode(with: [MyChat].self, from: "activeChats.json")
    let waitingChats = Bundle.main.decode(with: [MyChat].self, from: "waitingChats.json")
    
    enum Section: Int, CaseIterable {
        case waitingChats
        case activeChats
    }
    
    var dataSourse: UICollectionViewDiffableDataSource<Section, MyChat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        
        setupCollectionView()
        createDataSourse()
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
    
    private func setupCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        
        view.addSubview(collectionView)
        collectionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuseID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId2")
    }
    
    private func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, MyChat>()
        snapShot.appendSections([.waitingChats, .activeChats])
        snapShot.appendItems(activeChats, toSection: .activeChats)
        snapShot.appendItems(waitingChats, toSection: .waitingChats)
        dataSourse?.apply(snapShot, animatingDifferences: true)
        
    }
}
//MARK: Setup layouts
extension ListViewController {
    private func createCompositionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnviropment in
            
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unnouwn section")
            }
            
            switch section {
            case .activeChats:
                return self.createActivechats()
            case .waitingChats:
                return self.createWaitingChats()
            }
        }
        return layout
    }
    private func createWaitingChats() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88),
                                               heightDimension: .absolute(88))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                     subitems: [item])
        
       
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    private func createActivechats() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(78))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }
}
//MARK: Datasourse
extension ListViewController {
    private func configure<T: ConfiguringCell>(cellType: T.Type, with value: MyChat, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else {
            fatalError("Can't create a cell")
        }
        cell.configure(with: value)
        return cell
    }
    private func createDataSourse() {
        dataSourse = UICollectionViewDiffableDataSource<Section, MyChat>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            switch section {
            case .activeChats:
                return self.configure(cellType: ActiveChatCell.self, with: itemIdentifier, for: indexPath)
            case .waitingChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath)
                cell.backgroundColor = .red
                return cell
            }
        })
    }
   
}
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

//MARK: SwiftUI
import SwiftUI

struct ListProvider: PreviewProvider {
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
