//
//  FriendsTableViewController.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let friendsService = FriendsAPI()
    var friends: [FriendsJSON] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        friendsService.getFriends { friends in
            print ("получили друзей в контроллере")
            
            
            self.friends = friends
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let itemFriends = friends[indexPath.row]
        
        let url = URL(string: itemFriends.photo50)
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }
        
        cell.textLabel?.text = itemFriends.lastName
        return cell
    }
}
