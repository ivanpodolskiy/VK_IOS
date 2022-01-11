//
//  TextTableViewCell.swift
//  LessonOne
//
//  Created by user on 29.11.2021.
//
import Foundation
import UIKit






class TextTableViewCell: UITableViewCell {
    
    //: ExpandableLabel!
    
    @IBOutlet weak var textPostLabel: ExpandableLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func conf(text: String) {
        textPostLabel.text = text
     
    }
    
    
}
