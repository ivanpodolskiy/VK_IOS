//
//  MyGroupViewController.swift
//  LessonOne
//
//  Created by user on 19.09.2021.
//

import UIKit

class AllGroupViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var name = [
//    "1", "2", "3"]
//    var image: [UIImage] = [ #imageLiteral(resourceName: "MortyShrimp"), #imageLiteral(resourceName: "Rick"), #imageLiteral(resourceName: "Pickle Rick")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.register(UINib(nibName: "MyGroupCell", bundle: nil), forCellReuseIdentifier: "MGC")
        self.getDate()
    }
  
    var displayGroup:[DisplayGroup] = []

    
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
}


    extension AllGroupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return name.count
        return self.displayGroup.count
    }
        
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    tableView.dequeueReusableCell(withIdentifier: "AGC", for: indexPath) as! AllGroupCell
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
//
extension AllGroupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? AllGroupCell)?.configureter(with: self.displayGroup[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.displayGroup.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
}
