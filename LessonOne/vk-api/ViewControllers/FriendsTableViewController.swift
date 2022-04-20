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
    var friendsModel: Results<FriendsModel>?
    
    
    
    var token: NotificationToken?
    var friendsDB = FriendsDB()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var test = Array(1...10)
        test[0] = 3
        print (test)
        
        
        getFriend()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    
    func getFriend() {
        
        DispatchQueue.global(priority: .background).async{
            print ("добавляем друзей")
            print (Thread.current)
            self.friendsService.getFriends { [weak self] friends in
                
                guard let self = self else {return}
                print ("получили друзей в контроллере")
                self.friendsDB.delete()
                
                self.friendsDB.save(friends)
                self.friendsModel = self.friendsDB.load()
                
                self.token = self.friendsModel?.observe { [weak self] changes in
                    guard let self = self else {return}
                    
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
       
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let friendsModel = friendsModel else { return 0 }
        return friendsModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let itemFriends = friendsModel?[indexPath.row]
        
        let url = URL(string: itemFriends?.photo50 ?? "")
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }
        
        cell.textLabel?.text = itemFriends?.fullName
        return cell
    }
}
