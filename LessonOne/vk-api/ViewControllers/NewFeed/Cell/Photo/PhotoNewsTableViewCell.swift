//
//  PhotoNewsTableViewCell.swift
//  LessonOne
//
//  Created by user on 27.11.2021.
//

import UIKit

class PhotoNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView?
//
    
    func config(photoModel: String) {
        if let url = URL(string: photoModel) {
            let data = try? Data(contentsOf: url)
            photoImageView?.image = UIImage(data: data!)
            
        }
    }
}

