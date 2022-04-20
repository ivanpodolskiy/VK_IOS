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
        
        
        
        
        DispatchQueue.global(priority: .background).async {
            
            let dateInt = Double(datePublication)
            let date = Date(timeIntervalSince1970: dateInt)
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            print("Publication date is \(date)")
            
            let url = URL(string: image)
            let data = try? Data(contentsOf: url!)
            
            DispatchQueue.main.async {
                
                self.avatarView?.image = UIImage(data: data!)
                self.nameLable.text = name
                self.LastSeenLabel.text = dateformatter.string(from: date)
            }
            
        }
        
        
    }
    
    override func layoutSubviews() {
        DispatchQueue.main.async {
            self.avatarView.layer.borderWidth = 0.1
            self.avatarView.layer.masksToBounds = true
            self.avatarView.layer.borderColor = UIColor.black.cgColor
            self.avatarView.layer.cornerRadius = 50/2
            self.avatarView.clipsToBounds = true
        
        }
           
        
        
    }
    
}
