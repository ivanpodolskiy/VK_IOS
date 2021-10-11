//
//  NewsTableViewCell.swift
//  LessonOne
//
//  Created by user on 03.10.2021.
//

import UIKit


class NewsTableViewCell: UITableViewCell  {
 
    

    

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!

    
//    @IBOutlet weak var imageNews: UIImageView!
    //Кнопка
    
    
    @IBOutlet weak var imageNews: UIImageView!
    
    @IBOutlet weak var viewLikes: UIView!
  
    @IBOutlet weak var numberLike: UILabel!
    
    @IBOutlet weak var heartImage: UIButton!
   
    
    func configureNews(with item: displayNewsItem) {
        label.text = item.name
        avatarImage.image = item.iamgeAvatr
        imageNews.image = item.imageNews
        textNews.text = item.text
        
    }
    
    
    
    override func layoutSubviews() {
        //imageNew
        super.layoutSubviews()
        
    
        
        //like
       
        viewLikes.layer.cornerRadius = 4
        viewLikes.layer.borderWidth = 1
        viewLikes.layer.borderColor = UIColor.black.cgColor
        viewLikes.layer.backgroundColor = UIColor.white.cgColor
        
        //imageAvatar
        avatarImage.layer.borderWidth = 0.3
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.borderColor = UIColor.black.cgColor
        
        avatarImage.layer.cornerRadius = 50/2
    
        avatarImage.clipsToBounds = true
        imageNews.layer.cornerRadius = 2
        imageNews.layer.borderWidth = 1
   
        
        
    }
    
}


struct displayNewsItem{
    let name: String
    let iamgeAvatr: UIImage
    let imageNews: UIImage
    let text: String
}

