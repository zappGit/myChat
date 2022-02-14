//
//  Bundle+extension.swift
//  myChat
//
//  Created by Артем Хребтов on 14.02.2022.
//

import Foundation
import UIKit

extension Bundle {
    func decode<T: Codable>(with type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file)")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from \(file)")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        return loaded
    }
}
