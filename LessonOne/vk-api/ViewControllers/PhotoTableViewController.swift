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
   
    var photoModel: Results<PhotoModel>?
    var token: NotificationToken?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//
        
        getPhotoService.getPhoto { [weak self] photo in
//            guard let self = self else {return}
            self?.photoDB.save(photo)
            self?.photoModel = self!.photoDB.load()

            
            self?.token = self!.photoModel?.observe { [weak self] changes in
                guard let self = self else { return}
                
                switch changes {
                case .initial:
                           self.tableView.reloadData()
                    
                case .update(_, let deletions, let insertions, let modifications):
                                self.tableView.beginUpdates()
                                self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                                     with: .automatic)
                                self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                                     with: .automatic)
                                self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                                     with: .automatic)
                                self.tableView.endUpdates()


                    
                case .error(let error):
                    fatalError("\(error)")
                }
                
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        guard let photoModel = photoModel else { return 0 }
        return photoModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let itemFriends = self.photoModel?[indexPath.row]
        let size = itemFriends?.sizes[9]

        let url = URL(string: size?.url ?? "")
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }

        return cell
    }
    
    
}
