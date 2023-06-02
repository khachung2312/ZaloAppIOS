//
//  MessageByFriendsTableViewCell.swift
//  ChatZaloIOS
//
//  Created by Khắc Hùng on 31/05/2023.
//

import UIKit

class MessageByFriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTimeSentByFriends: UILabel!
    @IBOutlet weak var lblMessageByFriends: UILabel!
    @IBOutlet weak var lblNameFriend: UILabel!
    @IBOutlet weak var imgAvtFriend: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
