//
//  FriendsTableViewController.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import UIKit
import RealmSwift

class FriendsTableViewController: UITableViewController {
    
    let friendsService = FriendsAPI()
    var friendsModel: [FriendsModel] = []
    
    var friendsDB = FriendsDB()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")      
        friendsDB.delete()
        friendsService.getFriends { friends in
            print ("получили друзей в контроллере")
            
            self.friendsDB.save(friends)
            self.friendsModel = self.friendsDB.load()
            self.tableView.reloadData()
            print (self.friendsModel.count)
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.friendsModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let itemFriends = self.friendsModel[indexPath.row]
        
        let url = URL(string: itemFriends.photo50)
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }

        cell.textLabel?.text = itemFriends.fullName
        return cell
    }
}
