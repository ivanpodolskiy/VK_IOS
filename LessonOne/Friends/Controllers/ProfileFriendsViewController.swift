//
//  ProfileFriendsViewController.swift
//  LessonOne
//
//  Created by user on 17.09.2021.
//

import UIKit


class ProfileFriendsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceView(viewDisplayLike)
        self.update()
    }
    
    var itemUpdate: String = ""
    
    func update(){
        nameProfile.text = itemUpdate
        avatarProfile.image = UIImage(named: itemUpdate)
    }
    
  
    
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var avatarProfile: UIImageView!
    @IBOutlet weak var viewDisplayLike: UIView!
    @IBOutlet weak var numberLikes: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    
    func appearanceView(_ view: UIView) {
        view.addGestureRecognizer(tapGestureRecognizer)
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
//        view.layer.borderColor = UIColor.black.cgColor
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
           
            self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            UIView.animate(withDuration: 0.8, animations: {
                self.heartButton.tintColor = .red
                self.numberLikes.textColor = .red
            })
            self.viewDisplayLike.layer.borderColor = UIColor.red.cgColor
            
            counter = false
            
        } else {
            print (0)
            self.numberLikes.text = "0"
         
            self.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            
            UIView.animate(withDuration: 0.8, animations: {
                self.heartButton.tintColor = .black
                self.numberLikes.textColor = .black
            })
            self.viewDisplayLike.layer.borderColor = UIColor.black.cgColor
   
            counter = true
        }
    }
    

   
   
}


