//
//  HeaderCell.swift
//  IOS_2Seminar_Exercise
//
//  Created by 김지현 on 2020/05/14.
//  Copyright © 2020 김지현. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    static let identifier: String = "HeaderCell"

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataInformation(name: String, message: String, imageName: String) {
        myImage.image = UIImage(named: imageName)
        myNameLabel.text = name
        myMessageLabel.text = message
    }

}
