//
//  GroupsTableViewController.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import UIKit
import RealmSwift

class GroupsTableViewController: UITableViewController {
    let groupService = GroupsAPI()
    let groupDB = GropsDB()
    
    var groupModel: [GroupsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        groupService.getGroups { groups in
            print ("Получили группы в контроллере")
            self.groupDB.save(groups)
            self.groupModel = self.groupDB.load()
            self.tableView.reloadData()
        }
        
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let itemGrup = groupModel[indexPath.row]
        
        let url = URL(string: itemGrup.photo100)
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }
        
        cell.textLabel?.text = itemGrup.name
        
        return cell
    }
    
}
