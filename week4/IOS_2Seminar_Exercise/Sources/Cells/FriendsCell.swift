//
//  FriendsCell.swift
//  IOS_2Seminar_Exercise
//
//  Created by 김지현 on 2020/05/13.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {
    static let identifier: String = "FriendsCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataInformation(name: String, message: String, imageName: String) {
        friendImage.image = UIImage(named: imageName)
        nameLabel.text = name
        messageLabel.text = message
    }

}
