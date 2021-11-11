//
//  PhotoTableViewController.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    
    let getPhotoService = PhotoAPI()
    var photoModel: [PhotoModel] = []
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        super.viewDidLoad()

        getPhotoService.getPhoto { photo in
            print ("получили фото в контроллере")
            self.photoModel = photo
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photoModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let photo = photoModel[indexPath.row]
        let urlPhoto = photo.sizes[9].url
        
        let url = URL(string: urlPhoto)
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }
        
        return cell
    }
}
