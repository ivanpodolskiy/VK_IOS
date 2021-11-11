//
//  PhotoTableViewController.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    
    let getPhotoService = PhotoAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotoService.getPhoto { photo in
            print ("получили фото в контроллере")
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
        //test
    
}
