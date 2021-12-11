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
        globalQueueConcurrent()
        
        
    
    }
    
    func mainQueueIsSerial(){
        DispatchQueue.main.async { print ("H"); print (Thread.current) }
        DispatchQueue.main.async { print("e"); print (Thread.current) }
        DispatchQueue.main.async { print("l"); print (Thread.current) }
        DispatchQueue.main.async { print("l"); print (Thread.current)}
        DispatchQueue.main.async { print("o");  print (Thread.current)}
    }
    
    
    func globalQueueConcurrent(){
        DispatchQueue.global(qos: .userInteractive).async { print ("H"); print (Thread.current) }
        DispatchQueue.global(qos: .userInitiated).async { print("e"); print (Thread.current) }
        DispatchQueue.global(qos: .utility).async { print("l"); print (Thread.current) }
        DispatchQueue.global(qos: .default).async { print("l"); print (Thread.current)}
        DispatchQueue.global(qos: .background).async { print("o");  print (Thread.current)}
    }
    
    func dispQos(){
        DispatchQueue.main.async {
            for _ in (0..<100) {
                print ("😈")
                print (Thread.current)
            }
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            for _ in(0..<100) {
                print ("😇")
                print (Thread.current)
            }
        }
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in(0..<100) {
                print ("👻")
                print (Thread.current)
            }
        }
        
        DispatchQueue.global(qos: .utility).async {
            for _ in(0..<100) {
                print ("👽")
                print (Thread.current)
            }
        }
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
    
   
}
