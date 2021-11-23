//
//  NewsFeedTableViewController.swift
//  LessonOne
//
//  Created by user on 19.11.2021.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {

    
 
    
    let newService = NewsFeedAPI()

    var newModel: [Item] = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        newService.getNewsfeed{ [weak self]  new in
            guard let self = self else {return}
            self.newModel = new
            print (self.newModel.count)
            self.tableView.reloadData()
        }

      
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newModel.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let itemNews = newModel[indexPath.row]
       
        cell.textLabel?.text = itemNews.text
        let url = URL(string: itemNews.attachments?[0].photo.sizes[0].url ?? "")
        if let urlItem = url {
            if let data = try? Data(contentsOf: url!) {
                cell.imageView?.image = UIImage(data: data)
            }
        } else {
            print (url)
        }
        
        return cell
    }
    

}
