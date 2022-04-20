//
//  NewsFeedTableViewController.swift
//  LessonOne
//
//  Created by user on 19.11.2021.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {
    
    let newService = NewsFeedAPI()
    var newFeedModel: NewJSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.getNews()
    }
    

    func getNews() {
        DispatchQueue.global(priority: .background).async {
            print ("detNews \(Thread.current)")
            self.newService.getNewsfeed{ [weak self]  news in
                guard let self = self else {return}
                self.newFeedModel = news
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    //регистрация cell
    func registerCell(){
        
        //AuthorSection
        let nibAuthor = UINib(nibName: "AuthorAndTimeNewsTableViewCell", bundle: nil)
        self.tableView.register(nibAuthor, forCellReuseIdentifier: "AuthorAndTimeNewsTableViewCell")
        
        //TextSection
        let nibText = UINib(nibName: "TextTableViewCell", bundle: nil)
        self.tableView.register(nibText, forCellReuseIdentifier: "TextTableViewCell")
        
        
        //PhotoSection
        let nibPhoto = UINib(nibName: "PhotoNewsTableViewCell", bundle: nil)
        self.tableView.register(nibPhoto, forCellReuseIdentifier: "PhotoNewsTableViewCell")
        
        //LikesBarSection
        let nibLikesBar = UINib(nibName: "LikesTableViewCell", bundle: nil)
        self.tableView.register(nibLikesBar, forCellReuseIdentifier: "LikesTableViewCell")
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = newFeedModel else { return 0 }
        return sections.response.items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        guard let sections = newFeedModel else { return 0 }
        return 4
    }
    
    
    //Url фото для PhotoSection
    //Обновеленный метод принимает массив size определенной фотографии
    func findURL(items: [Size]?) -> String? {
        
        DispatchQueue.global(priority: .background).sync {
            var url = String()
            guard let items = items else {return url}
            //            for items in items {
            //
            for items in items {
                if items.type == "x" {
                    url = items.url
                }
            }
            return url
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let profiles = newFeedModel?.response.profiles,
              let groups = newFeedModel?.response.groups,
              let items = newFeedModel?.response.items else { return UITableViewCell() }
        
        
        let source = items[indexPath.section].sourceID
        var name, string: String?
        
        if source < 0  {
            DispatchQueue.global(priority: .background).async {
                print ( "groups.forEach \(Thread.current)" )
                groups.forEach {
                    if $0.id == abs(source) {
                        print($0.id)
                        name = $0.name
                        string = $0.photo100
                        
                    } else {
                        profiles.forEach {
                            if $0.id == source {
                                print($0.id)
                                name = $0.firstName + " " + $0.lastName
                                string = $0.photo100
                            }
                        }
                    }
                }
            }
        }
        

        
        switch (indexPath.section) {
            
        default:
            
            switch indexPath.row {
            case 0:
                print ("Instaling Avtar cell \(indexPath.row)")
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorAndTimeNewsTableViewCell", for: indexPath) as! AuthorAndTimeNewsTableViewCell
                
                
                //поменял indexPath.setion на indexPath.row
                
                DispatchQueue.global().async {
                    print ("Instaling Avtar items \(Thread.current)")
                    let avtarNews = self.newFeedModel?.response.groups[indexPath.row]
                    let data = self.newFeedModel?.response.items[indexPath.section].date ?? 0
                    let url = avtarNews?.photo100 ?? ""
                    
                    DispatchQueue.main.sync {
                        print ("config Avatar \(Thread.current)")
                        cell.config(name: name ?? "", image: string ?? "", datePublication: data)
                    }
                }
                return cell
                
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
                
                let textNews = self.newFeedModel?.response.items[indexPath.section]
                if let tex = textNews?.text {
                    cell.conf(text: tex)
                } else {
                    print ("error index")
                }
                
                return cell
                
            case 2:
                
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "PhotoNewsTableViewCell", for: indexPath) as! PhotoNewsTableViewCell
                guard let imag = findURL(items: items[indexPath.section].attachments[0].photo?.sizes) else { let cell = UITableViewCell()
                    cell.backgroundColor = .systemGray6
                    return cell
                }
                
                cell.config(photoModel: imag)
                return cell
                
                
                
                
                
            case 3:
                
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "LikesTableViewCell", for: indexPath) as! LikesTableViewCell
                
                DispatchQueue.global().async {
                    print ("likesBar items \(Thread.current)")
                    let item = self.newFeedModel?.response.items[indexPath.section]
                    let numLikes = item?.likes?.count ?? 0
                    let numComments = item?.comments?.count ?? 0
                    let numReposts = item?.reposts?.count ?? 0
                    let numView: Int  = item?.views.count ?? 0
                    
                    DispatchQueue.main.async {
                        print ("likesBar connfig \(Thread.current)")
                        cell.config(numLike: numLikes, numComments: numComments, numReposts: numReposts, numViews: numView)
                    }
                }
                
                return cell
                
                
                
                
            default:
                print ("There is no data \(indexPath.row)")
                let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorAndTimeNewsTableViewCell", for: indexPath) as! AuthorAndTimeNewsTableViewCell
                tableView.tableFooterView = nil
                
                return cell
                
            }
        }
        
    }
}

