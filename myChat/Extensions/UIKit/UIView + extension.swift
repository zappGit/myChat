//
//  UIView + extension.swift
//  myChat
//
//  Created by Артем Хребтов on 07.03.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func configure<T: ConfiguringCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else {
            fatalError("Can't create a cell")
        }
        cell.configure(with: value)
        return cell
    }
}
