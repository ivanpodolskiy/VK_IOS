//
//  AuthorAndTimeNewsTableViewCell.swift
//  LessonOne
//
//  Created by user on 24.11.2021.
//

import UIKit

class AuthorAndTimeNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var LastSeenLabel: UILabel!
    
    
    
    func config(name: String, image: String, datePublication: Int) {
        
        self.nameLable.text = name
        
        if let url = URL(string: image) {
            let data = try? Data(contentsOf: url)
            avatarView?.image = UIImage(data: data!)
    }
        
        let dateInt = Double(datePublication) 
                        let date = Date(timeIntervalSince1970: dateInt)
                        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .full
        print("Publication date is \(date)")
        self.LastSeenLabel.text = dateformatter.string(from: date)
    }
    
    override func layoutSubviews() {
        avatarView.layer.borderWidth = 0.1
        avatarView.layer.masksToBounds = true
        avatarView.layer.borderColor = UIColor.black.cgColor
        avatarView.layer.cornerRadius = 50/2
        avatarView.clipsToBounds = true

    }
    
}
