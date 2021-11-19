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
    
    var groupModel: Results<GroupsModel>?
    
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        groupService.getGroups { [weak self] groups in
            guard let self = self else {return}
            
            print ("Получили группы в контроллере")
            self.groupDB.save(groups)
            self.groupModel = self.groupDB.load()
            
            self.token = self.groupModel?.observe { [weak self] changes in
                guard let self = self else {return}
                
                switch changes{
                    
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
        
        guard let groupModel = groupModel else { return 0 }
        return groupModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let itemGrup = groupModel?[indexPath.row]
        
        let url = URL(string: itemGrup?.photo100 ?? "")
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }
        
        cell.textLabel?.text = itemGrup?.name
        
        return cell
    }
    
}
