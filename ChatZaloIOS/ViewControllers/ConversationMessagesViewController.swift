//
//  ConversationMessagesViewController.swift
//  ChatZaloIOS
//
//  Created by Khắc Hùng on 31/05/2023.
//

import UIKit

class ConversationMessagesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate , UITextFieldDelegate {
    @IBOutlet weak var txtSentMessage: UITextField!
    @IBOutlet weak var tblMessages: UITableView!
    var messages: [Message] = []
    var userDatabaseObject = UsersDatabase()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMessages.dataSource = self
        tblMessages.delegate = self
        txtSentMessage.delegate = self
        tblMessages.register(UINib(nibName: "MessageByFriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageByFriendCellIdentifier")
        tblMessages.register(UINib(nibName: "MessageByLoggedInUserTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageByLoggedInUserCellIdentifier")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messages[indexPath.row].senderID == 1 {
            let messageCellByMe = tblMessages.dequeueReusableCell(withIdentifier: "MessageByLoggedInUserCellIdentifier") as! MessageByLoggedInUserTableViewCell
            messageCellByMe.lblMessageByLoggedInUser.text = messages[indexPath.row].content
            messageCellByMe.lblTimeSentByLoggedInUser.text = messages[indexPath.row].time
            messageCellByMe.imgAvtLoggedInUser.image = UIImage(named: userDatabaseObject.getUserDetailByID(userID: messages[indexPath.row].senderID)!.avatar)
            return messageCellByMe
        }
        let messageCellByFriend = tblMessages.dequeueReusableCell(withIdentifier: "MessageByFriendCellIdentifier") as! MessageByFriendsTableViewCell
        messageCellByFriend.lblNameFriend.text = userDatabaseObject.getUserDetailByID(userID: messages[indexPath.row].senderID)!.fullName
        messageCellByFriend.lblMessageByFriends.text = messages[indexPath.row].content
        messageCellByFriend.lblTimeSentByFriends.text = messages[indexPath.row].time
        messageCellByFriend.imgAvtFriend.image = UIImage(named: userDatabaseObject.getUserDetailByID(userID: messages[indexPath.row].senderID)!.avatar)
        return messageCellByFriend
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        messages.remove(at: indexPath.row)
        tblMessages.reloadData()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtSentMessage {
            if !txtSentMessage.text!.isEmpty {
                sendChatMessage()
            }
            txtSentMessage.text = ""
            return false
        }
        return true
    }

    func sendChatMessage() {
        guard let content = txtSentMessage.text, !content.isEmpty else {
            return
        }
        let message = Message(id: 1, content: content, senderID: 1, conversationID: 0, time: "", status: "")
        messages.append(message)
        tblMessages.reloadData()
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        tblMessages.scrollToRow(at: indexPath, at: .bottom, animated: true)
        txtSentMessage.text = ""
    }

    
    
}
