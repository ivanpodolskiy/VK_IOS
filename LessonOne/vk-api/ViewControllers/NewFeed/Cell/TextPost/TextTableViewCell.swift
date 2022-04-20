//
//  TextTableViewCell.swift
//  LessonOne
//
//  Created by user on 29.11.2021.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textPostLabel: UILabel!
    
    func conf(text: String?) {
//        DispatchQueue.main.sync {
            self.textPostLabel.text = text
            self.textPostLabel.lineBreakMode  = .byWordWrapping
            self.textPostLabel.numberOfLines = 0
//        }
    }
}
