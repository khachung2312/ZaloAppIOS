//
//  UserDatabase.swift
//  ChatZaloIOS
//
//  Created by Khắc Hùng on 31/05/2023.
//

import Foundation

class UsersDatabase {
    var usersDB: [User] = []
    
    init() {
        let userID1 = User(id: 1, fullName: "Nguyen Khac Hung", avatar: "avt01", phone: "0111111", password: "", friends: [])
        let userID2 = User(id: 2, fullName: "Vu Dinh Duan", avatar: "avt02", phone: "0222222", password: "", friends: [])
        let userID3 = User(id: 3, fullName: "Giap Thi Phuong", avatar: "avt03", phone: "0333333", password: "", friends: [])
        let userID4 = User(id: 4, fullName: "Nguyen Thi Trang", avatar: "avt04", phone: "0444444", password: "", friends: [])
        let userID5 = User(id: 5, fullName: "Le Dinh Linh", avatar: "avt03", phone: "0555555", password: "", friends: [])
        let userID6 = User(id: 6, fullName: "Nguyen Manh Linh", avatar: "avt01", phone: "06666666", password: "", friends: [])
        let userID7 = User(id: 7, fullName: "Dinh Tien Hoang", avatar: "avt04", phone: "07777777", password: "", friends: [])
        
        
        self.usersDB.append(userID1)
        self.usersDB.append(userID2)
        self.usersDB.append(userID3)
        self.usersDB.append(userID4)
        self.usersDB.append(userID5)
        self.usersDB.append(userID6)
        self.usersDB.append(userID7)
    }
    
    func getUserDetailByID (userID: Int) -> User? {
        for anUser in usersDB {
            if anUser.id == userID {
                return anUser
            }
        }
        return nil
    }
}
