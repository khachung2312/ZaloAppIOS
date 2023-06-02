//
//  MessageByLoggedInUserTableViewCell.swift
//  ChatZaloIOS
//
//  Created by Khắc Hùng on 31/05/2023.
//

import UIKit

class MessageByLoggedInUserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTimeSentByLoggedInUser: UILabel!
    @IBOutlet weak var lblMessageByLoggedInUser: UILabel!
    @IBOutlet weak var imgAvtLoggedInUser: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
