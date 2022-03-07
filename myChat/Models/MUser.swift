//
//  MUser.swift
//  myChat
//
//  Created by Артем Хребтов on 21.02.2022.
//

import Foundation

struct MyUser: Codable, Hashable {
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: MyUser, rhs: MyUser) -> Bool {
        return lhs.id == rhs.id
    }
}
