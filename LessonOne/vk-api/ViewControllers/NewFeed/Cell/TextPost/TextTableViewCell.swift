//
//  TextTableViewCell.swift
//  LessonOne
//
//  Created by user on 29.11.2021.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var textPostLabel: UILabel!
    
   
    func conf(tesxt: String?) {
        let nu = tesxt
        self.textPostLabel.text = nu
        textPostLabel.lineBreakMode  = .byWordWrapping
        textPostLabel.numberOfLines = 0
    }

    
}
