//
//  MChat.swift
//  myChat
//
//  Created by Артем Хребтов on 21.02.2022.
//

import Foundation

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
