//
//  NewsTableViewCell.swift
//  LessonOne
//
//  Created by user on 03.10.2021.
//

import UIKit


class NewsTableViewCell: UITableViewCell, BControllerDelegate
{
    
    
 

    

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
        
        
       
//        imageNews.layer.cornerRadius = 2
//        imageNews.layer.borderWidth = 1
   
        
        
    }
    

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}


struct displayNewsItem{
    let name: String
    let iamgeAvatr: UIImage
    let imageNews: UIImage
    let text: String
}

