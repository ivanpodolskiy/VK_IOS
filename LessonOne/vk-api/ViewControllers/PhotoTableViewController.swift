//
//  PhotoTableViewController.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import UIKit
import RealmSwift

class PhotoTableViewController: UITableViewController {
    
    let getPhotoService = PhotoAPI()
    var photoDB = PhotoDB()
   
    var photoModel: [PhotoModel] = []
    
    
    override func viewDidLoad() {

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        photoDB.delete()
        super.viewDidLoad()
        getPhotoService.getPhoto { photo in
//            self.photoModel = photo
            self.photoDB.delete()
            self.photoDB.save(photo)
            self.photoModel = self.photoDB.load()
//            self.photoModel = photo
            self.tableView.reloadData()
            print ("получили фото в контроллере")
        }
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.photoModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let itemFriends = self.photoModel[indexPath.row]
        let sizee = itemFriends.sizes[9]

        let url = URL(string: sizee.url)
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }

        return cell
    }
    
    
}
