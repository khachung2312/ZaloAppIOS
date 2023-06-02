//
//  ConversationModel.swift
//  ChatZaloIOS
//
//  Created by Khắc Hùng on 31/05/2023.
//

import Foundation

class Conversation {
    var id: Int = 0
    var name: String = ""
    var members: [User] = []
    var messages: [Message] = []
    var managers: [User] = []
    
    init(id: Int, name: String, members: [User], messages: [Message], managers: [User]) {
        self.id = id
        self.name = name
        self.members = members
        self.messages = messages
        self.managers = managers
    }
}
