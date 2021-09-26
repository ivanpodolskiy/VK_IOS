//
//  FirendsTableViewCell.swift
//  LessonOne
//
//  Created by user on 17.09.2021.
//

import UIKit

class FirendsTableViewCell: UITableViewCell {
    
  

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarLabel: UIImageView!
    

    
   
    
  
    func configure(with item: DisplayItem) {
        self.nameLabel.text = item.name
        self.avatarLabel.image = item.avatar
    }
    
    
    
}

struct DisplayItem {
    let name: String
    let avatar: UIImage
}
