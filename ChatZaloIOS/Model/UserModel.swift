//
//  UserModel.swift
//  ChatZaloIOS
//
//  Created by Khắc Hùng on 31/05/2023.
//

import Foundation

class User {
    var id: Int = 0
    var fullName: String = ""
    var avatar: String = ""
    var phone: String = ""
    var password: String = ""
    var friends: [User] = []
    
    init(id: Int, fullName: String, avatar: String, phone: String, password: String, friends: [User]) {
        self.id = id
        self.fullName = fullName
        self.avatar = avatar
        self.phone = phone
        self.password = password
        self.friends = friends
    }
}
