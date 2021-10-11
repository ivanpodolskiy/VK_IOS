//
//  NewsPageViewController.swift
//  LessonOne
//
//  Created by user on 03.10.2021.
//

import UIKit




class NewsPageViewController: UIViewController {
 
    
    @IBOutlet weak var newsTableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableVIew.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    
    let itemNews: [displayNewsItem] = [
        .init(name: "Morty", iamgeAvatr: #imageLiteral(resourceName: "Morty"), imageNews: #imageLiteral(resourceName: "travel"), text: "Сегодня плавал на байдарке"),
        .init(name: "Rick", iamgeAvatr: #imageLiteral(resourceName: "Rick"), imageNews: #imageLiteral(resourceName: "image"), text: "Смотрите какое фото!"),
        .init(name: "Naruto Uzumaki", iamgeAvatr: #imageLiteral(resourceName: "Naruto Uzumaki"), imageNews: #imageLiteral(resourceName: "japan2"), text: "Тут вкусный рамен")
    ]
}


extension NewsPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        newsTableVIew.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath)
    }
    
}

extension NewsPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? NewsTableViewCell)?.configureNews(with: self.itemNews[indexPath.row])
    }
    
   
}
