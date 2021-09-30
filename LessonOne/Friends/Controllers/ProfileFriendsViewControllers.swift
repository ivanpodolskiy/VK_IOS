//
//  ProfileFriendsViewControllers.swift
//  LessonOne
//
//  Created by user on 17.09.2021.
//

import UIKit

class ProfileFriendsViewControllers: UIViewController {
   
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var avatarProfile: UIImageView!
   
    @IBOutlet weak var viewDisplayLike: UIView!
    
    @IBOutlet weak var numberLikes: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    
    
    
    func appearanceView(_ view: UIView) {
        view.addGestureRecognizer(tapGestureRecognizer)
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
    }
    
    
    var display: DisplayItem?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        appearanceView(viewDisplayLike)
    }
    
    
    lazy var tapGestureRecognizer: UIGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        return recognizer
        
    }()
    
    var counter: Bool = true
    
    @objc func onTap(_ gesture: UIGestureRecognizer) {
        
        if counter == true {
            print (1)
            self.numberLikes.text = "1"
            self.numberLikes.textColor = UIColor.red
            self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.heartButton.tintColor = UIColor.red
            counter = false
            
        } else {
            print (0)
            self.numberLikes.text = "0"
            self.numberLikes.textColor = UIColor.black
            self.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            self.heartButton.tintColor = UIColor.black
            counter = true
        }
    }
    
    func setUI() {
      
        nameProfile.text = display?.name
        avatarProfile.image = display?.avatar
    }
    
}

