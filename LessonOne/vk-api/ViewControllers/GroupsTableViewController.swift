//
//  GroupsTableViewController.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import UIKit
//import RealmSwift
import Firebase

class GroupsTableViewController: UITableViewController {
    let groupService = GroupsAPI()
//    let groupDB = GropsDB()
    
    var gorupModel2: [GroupsModel] = []
    
//    var groupModel: Results<GroupsModel>?
    
//    var token: NotificationToken?
    
    let ref = Database.database().reference(withPath: "group")
    let authService = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        groupService.getGroups { [weak self] groups in
            guard let self = self else {return}
            
            self.gorupModel2 = groups
            print ("Получили группы в контроллере")
            self.tableView.reloadData()
            
//            self.groupDB.save(groups)
//            self.groupModel = self.groupDB.load()
//
//            self.token = self.groupModel?.observe { [weak self] changes in
//                guard let self = self else {return}
//
//                switch changes{
//
//                case .initial:
//                           self.tableView.reloadData()
//
//                case .update(_, let deletions, let insertions, let modifications):
//                                self.tableView.beginUpdates()
//                                self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
//                                                     with: .automatic)
//                                self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
//                                                     with: .automatic)
//                                self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
//                                                     with: .automatic)
//                                self.tableView.endUpdates()
//
//
//
//                case .error(let error):
//                    fatalError("\(error)")
//                }
//
//            }
            
            
        }
        
        
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
//        guard let groupModel = groupModel else { return 0 }
//        return groupModel.count
        
        return gorupModel2.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let itemGrup = gorupModel2[indexPath.row]
//
        let url = URL(string: itemGrup.photo100 ?? "")
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
            cell.textLabel?.text = itemGrup.name
        }
        
            //Сохранение в Fairebase
        let group = GroupsFirebse(name: itemGrup.name)
        print (group.name)
        let cityContainerRef = self.ref.child(group.name).childByAutoId()
        cityContainerRef.setValue(group.toAnyObject())
//
//
        return cell
    }
    
}
