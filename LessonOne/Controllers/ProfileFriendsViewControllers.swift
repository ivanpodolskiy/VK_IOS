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
   

    var display: DisplayItem?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
      
        nameProfile.text = display?.name
        avatarProfile.image = display?.avatar
    }
    
}

