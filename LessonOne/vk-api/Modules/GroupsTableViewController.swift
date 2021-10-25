//
//  GroupsTableViewController.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    let groupService = GroupsAPI()
    
    var groups: [GroupsJSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        groupService.getGroups { groups in
            print ("Получили группы в контроллере")
            
            self.groups = groups
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let itemGrup = groups[indexPath.row]
        
        let url = URL(string: itemGrup.photo50)
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }
        
        cell.textLabel?.text = itemGrup.name
        
        return cell
    }
    
}
