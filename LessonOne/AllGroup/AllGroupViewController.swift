//
//  MyGroupViewController.swift
//  LessonOne
//
//  Created by user on 19.09.2021.
//

import UIKit

class AllGroupViewController: UIViewController {
 
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
//        self.tableView.register(UINib(nibName: "MyGroupCell", bundle: nil), forCellReuseIdentifier: "MGC")
     
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        self.getDate()
        super.viewDidLoad()
    }
  
    var displayGroup:[DisplayGroup] = []
     var fillterNames = [DisplayGroup]()
    
    
    
    private func getDate() {
        let mocItems: [DisplayGroup] = [
            .init(name: "Рецепты на каждый день", image: #imageLiteral(resourceName: "recipes")),
            .init(name: "Классическая музыка", image: #imageLiteral(resourceName: "classic")),
            .init(name: "Подборка сериалов", image: #imageLiteral(resourceName: "serials")),
            .init(name: "Уголок читателя", image: #imageLiteral(resourceName: "books")),
            .init(name: "Путешествия", image: #imageLiteral(resourceName: "travel"))]
        self.displayGroup = mocItems
        self.tableView.reloadData()
    }
    
    
    
     let searchController = UISearchController(searchResultsController: nil)
    
    
    private var searchBarISEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false}
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarISEmpty
    }
    
}


    extension AllGroupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return name.count
        
        if isFiltering {
            return fillterNames.count
        }
        return self.displayGroup.count
    }
        
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AGC", for: indexPath) as! AllGroupCell
        
        var restaurantDisplayGroup: DisplayGroup
        
        if isFiltering {
            restaurantDisplayGroup = fillterNames[indexPath.row]
        }
        else {
            restaurantDisplayGroup = displayGroup[indexPath.row]
        }
        
        cell.configureter(with: restaurantDisplayGroup)
       return cell
//        cell.configure(with: MyGroupCell.DisplayIthem)
//        cell.configure(with: self.displayIthem[indexPath.row])
//        let title = name[indexPath.row]
//        let imageA = image[indexPath.row]
//        cell.nameGroup.text = title
//        cell.avatarGroup.image = imageA
//        return cell
//
    }
   
}

extension AllGroupViewController: UITableViewDelegate {
    

//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        (cell as? AllGroupCell)?.configureter(with: fillterNames[indexPath.row])
//    }
}

extension AllGroupViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }

    private func filterContentForSearchText(_ serachText: String) {
        
        fillterNames = displayGroup.filter({ (displayGroup: DisplayGroup)  -> Bool in
            return displayGroup.name.lowercased().contains(serachText.lowercased())
        })
        tableView.reloadData()
    }
    

}
