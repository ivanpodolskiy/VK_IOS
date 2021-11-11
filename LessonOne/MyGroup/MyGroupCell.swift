//
//  MyGroupCell.swift
//  LessonOne
//
//  Created by user on 20.09.2021.
//

import UIKit

class MyGroupCell: UITableViewCell {
    
    @IBOutlet weak var avatarAll: UIImageView!
    @IBOutlet weak var nameAll: UILabel!
    
    
    func config(with item: DisplayGroup) {
        self.avatarAll.image = item.image
        self.nameAll.text = item.name
    }
}

