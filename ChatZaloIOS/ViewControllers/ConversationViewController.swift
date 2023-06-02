//
//  ConversationViewController.swift
//  ChatZaloIOS
//
//  Created by Khắc Hùng on 31/05/2023.
//

import UIKit

class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var lblNotFound: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblConversation: UITableView!
    let groupChatAvatar = ["GCA01", "GCA02", "GCA03", "GCA04", "GCA05"]
    var conversations: [Conversation] = []
    var filteredData: [Conversation]!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNotFound.isHidden = true
        initData()
        filteredData = conversations
        tblConversation.dataSource = self
        tblConversation.delegate = self

    }
    
    func initData() {
        
        var messageConversation01: [Message] = []
        
        let message01OfConversation01 = Message(id: 1, content: "Xin chao cac ban!", senderID: 2, conversationID: 1, time: "06:23", status: "Thanh cong")
        let message02OfConversation01 = Message(id: 2, content: "Chao buoi sang", senderID: 1, conversationID: 1, time: "06:24", status: "Thanh cong")
        let message03OfConversation01 = Message(id: 3, content: "Chuc moi nguoi ngay moi vui ve", senderID: 4, conversationID: 1, time: "07:15", status: "Thanh cong")
        let message04OfConversation01 = Message(id: 4, content: "Cam on ban", senderID: 3, conversationID: 1, time: "08:00", status: "Thanh cong")
        let message05OfConversation01 = Message(id: 5, content: "Hello", senderID: 4, conversationID: 1, time: "08:11", status: "Thanh cong")
        
        messageConversation01.append(message01OfConversation01)
        messageConversation01.append(message02OfConversation01)
        messageConversation01.append(message03OfConversation01)
        messageConversation01.append(message04OfConversation01)
        messageConversation01.append(message05OfConversation01)
        
        var messageConversation02: [Message] = []
        
        let message01OfConversation02 = Message(id: 1, content: "Hello everyone", senderID: 1, conversationID: 2, time: "12:00", status: "Thanh cong")
        let message02OfConversation02 = Message(id: 2, content: "Cac ban khoe khong", senderID: 7, conversationID: 2, time: "12:12", status: "Thanh cong")
        let message03OfConversation02 = Message(id: 3, content: "Toi cam thay rat on", senderID: 1, conversationID: 2, time: "13:11", status: "Thanh cong")
        let message04OfConversation02 = Message(id: 4, content: "Chung minh hoc bai thoi", senderID: 5, conversationID: 2, time: "14:09", status: "Thanh cong")
        
        messageConversation02.append(message01OfConversation02)
        messageConversation02.append(message02OfConversation02)
        messageConversation02.append(message03OfConversation02)
        messageConversation02.append(message04OfConversation02)
        
        let conversation01 = Conversation(id: 1, name: "K17-VietDeverloper", members: [], messages: messageConversation01, managers: [])
        let conversation02 = Conversation(id: 2, name: "Lop hoc nhom lap trinh", members: [], messages: messageConversation02, managers: [])
        let conversation03 = Conversation(id: 3, name: "Gia dinh cua toi", members: [], messages: messageConversation01, managers: [])
        let conversation04 = Conversation(id: 4, name: "Anh em chung minh", members: [], messages: messageConversation01, managers: [])
        let conversation05 = Conversation(id: 5, name: "Hiep hoi chem gio", members: [], messages: messageConversation01, managers: [])
        
        conversations.append(conversation01)
        conversations.append(conversation02)
        conversations.append(conversation03)
        conversations.append(conversation04)
        conversations.append(conversation05)
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblConversation.dequeueReusableCell(withIdentifier: "ConversationCellIdentifier")!
        let lblConversationName = cell.viewWithTag(101) as! UILabel
        lblConversationName.text = filteredData[indexPath.row].name
        let imgGroupChatAvt = cell.viewWithTag(100) as! UIImageView
        imgGroupChatAvt.image = UIImage(named: groupChatAvatar[indexPath.row])
        imgGroupChatAvt.layer.cornerRadius = 30
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messagesConversationVC = self.storyboard!.instantiateViewController(withIdentifier: "ConversationMessagesViewController") as! ConversationMessagesViewController
        messagesConversationVC.messages = conversations[indexPath.row].messages
        show(messagesConversationVC, sender: self)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        conversations.remove(at: indexPath.row)
        tblConversation.reloadData()
    }
    
}

extension ConversationViewController:  UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = conversations
        }
        for word in conversations {
            if word.name.uppercased().contains(searchText.uppercased()) {
                filteredData.append(word)
            }
        }
        if filteredData.count == 0 {
            lblNotFound.isHidden = false
            tblConversation.isHidden = true
        }
        else {
            lblNotFound.isHidden = true
            tblConversation.isHidden = false
        }
        tblConversation.reloadData()
        
    }
}
