//
//  imageFriends.swift
//  LessonOne
//
//  Created by user on 25.09.2021.
//

import UIKit

class imageFriends: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.size.width/2
    
        self.clipsToBounds = true

    }
}
