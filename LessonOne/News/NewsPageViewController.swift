//
//  NewsPageViewController.swift
//  LessonOne
//
//  Created by user on 03.10.2021.
//

import UIKit


protocol BControllerDelegate: AnyObject{
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage?
}

class NewsPageViewController: UIViewController{
 
  
    weak var delegate: BControllerDelegate?
    
    @IBOutlet weak var newsTableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableVIew.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    
    }
    
   
    
    
    let itemNews: [displayNewsItem] = [
        .init(name: "Naruto Uzumaki", iamgeAvatr: #imageLiteral(resourceName: "Naruto Uzumaki"), imageNews: #imageLiteral(resourceName: "japanese"), text: "Вксуный рамен!!!"),
        .init(name: "Rick", iamgeAvatr: #imageLiteral(resourceName: "Rick"), imageNews: #imageLiteral(resourceName: "newImage"), text: "Красивое место?")
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
    
    func lol() {
        
    }
}
