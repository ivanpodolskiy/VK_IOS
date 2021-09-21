//
//  AllGroupCell.swift
//  LessonOne
//
//  Created by user on 19.09.2021.
//

import UIKit

class AllGroupCell: UITableViewCell{
    
    @IBOutlet weak var avatarGroup: UIImageView!
    
    @IBOutlet weak var nameGroup: UILabel!
    
    
    
    
    func configureter(with item: DisplayGroup ) {
        self.avatarGroup.image = item.image
        self.nameGroup.text = item.name
    }
}


struct DisplayGroup {
    let name: String
    let image: UIImage
}
