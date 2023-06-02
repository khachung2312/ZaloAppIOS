//
//  ConversationFriendsViewController.swift
//  ChatZaloIOS
//
//  Created by Khắc Hùng on 31/05/2023.
//

import UIKit

class ConversationFriendsViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tblFriends: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblNotFound: UILabel!
    var friends: [User] = []
    var filteredData: [User]!
    var userDatabaseObject = UsersDatabase()

    override func viewDidLoad() {
        super.viewDidLoad()
        lblNotFound.isHidden = true
        initFriendsData()
        filteredData = friends
        tblFriends.dataSource = self
        tblFriends.delegate = self
        searchBar.delegate = self
        
    }
    
    func initFriendsData (){
        
        let friendOfUser01 = User(id: 1, fullName: "Vu Dinh Duan", avatar: "avt01", phone: "02342342", password: "1234", friends: [])
        let friendOfUser02 = User(id: 2, fullName: "Le Dinh Linh", avatar: "avt02", phone: "0345223", password: "2345", friends: [])
        let friendOfUser03 = User(id: 3, fullName: "Dinh Tien Hoang", avatar: "avt03", phone: "023424", password: "3456", friends: [])
        let friendOfUser04 = User(id: 4, fullName: "Giap Thi Phuong", avatar: "avt04", phone: "03434523", password: "4567", friends: [])
        let friendOfUser05 = User(id: 5, fullName: "Nguyen Manh Linh", avatar: "avt02", phone: "0457423", password: "5678", friends: [])
        let friendOfUser06 = User(id: 6, fullName: "Nguyen Thi Ha", avatar: "avt03", phone: "02342342", password: "6789", friends: [])
        let friendOfUser07 = User(id: 7, fullName: "Tran Van Nam", avatar: "avt01", phone: "023236232", password: "7890", friends: [])
        
        friends.append(friendOfUser01)
        friends.append(friendOfUser02)
        friends.append(friendOfUser03)
        friends.append(friendOfUser04)
        friends.append(friendOfUser05)
        friends.append(friendOfUser06)
        friends.append(friendOfUser07)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "FriendsCellIndentifier")!

        let imgAvatarFriend = cell.viewWithTag(100) as! UIImageView
        imgAvatarFriend.image = UIImage(named: filteredData[indexPath.row].avatar)
        imgAvatarFriend.layer.cornerRadius = 30
        
        let lblFullNameFriend = cell.viewWithTag(101) as! UILabel
        lblFullNameFriend.text = filteredData[indexPath.row].fullName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        friends.remove(at: indexPath.row)
        tblFriends.reloadData()
    }

}

extension ConversationFriendsViewController:  UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = friends
        }
        for word in friends {
            if word.fullName.uppercased().contains(searchText.uppercased()) {
                filteredData.append(word)
            }
        }
        if filteredData.count == 0 {
            lblNotFound.isHidden = false
            tblFriends.isHidden = true
        }
        else {
            lblNotFound.isHidden = true
            tblFriends.isHidden = false
        }
        tblFriends.reloadData()
        
    }
}
