//
//  FriendsViewController.swift
//  LessonOne
//
//  Created by user on 17.09.2021.
//

import UIKit



class FriendsViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TableView.register(R.Nib.friendsNib, forCellReuseIdentifier: R.cell.friendsCell)
        createNameDict()
    }
    
    @IBOutlet weak var TableView: UITableView!
      
    let nameCollection = ["Morty", "Rick", "Goku", "BoJack", "Mr. Peanutbutter", "Naruto Uzumaki", "Todd Chavez", "Totoro"]
    
    
// MARK: Generating keys
    
    var nameDict = [String: [String]]()
    var nameSectionTitles = [String]()
    
    func createNameDict(){
        for name in nameCollection {
            let firstLetterIndex = name.index(name.startIndex, offsetBy: 1)
            let nameKay = String(name[..<firstLetterIndex])
            
            if var nameValues = nameDict[nameKay] {
                nameValues.append(name)
                nameDict[nameKay] = nameValues
            } else {
                nameDict[nameKay] = [name]
            }
        }
        
        nameSectionTitles = [String](nameDict.keys)
        nameSectionTitles = nameSectionTitles.sorted(by: {$0 < $1})
    }
}

// MARK:- UITableViewDataSource


extension FriendsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nameSectionTitles.count
        
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let nameKey = nameSectionTitles[section]
        guard  let nameValues = nameDict[nameKey] else {return 0}
        
        return nameValues.count
    }
    
    // MARK: Сreation and customization Header
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nameSectionTitles[section]
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 25
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let headerView = view as! UITableViewHeaderFooterView
        headerView.backgroundColor? = UIColor.red
        headerView.textLabel?.font = UIFont(name: "Name", size: 25)
        headerView.textLabel?.textColor = .black
        
    }
    
    // MARK: Assigning a value for nameLable and avatarLable
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celll = TableView.dequeueReusableCell(withIdentifier: R.cell.friendsCell, for: indexPath)
        
        //изменяем cell
        let nameKey = nameSectionTitles[indexPath.section]
        if let nameValues = nameDict[nameKey] {
            (celll as? FirendsTableViewCell)?.nameLabel.text = nameValues[indexPath.row]
            (celll as? FirendsTableViewCell)?.avatarLabel.image = UIImage(named: nameValues[indexPath.row])
        }
        return celll
    }
}


// MARK: - UITableViewDataSource

extension FriendsViewController: UITableViewDelegate {
   
    // MARK: Removing UITableViewCell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
        if editingStyle == .delete {
            nameSectionTitles.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    // MARK: Transition to ProfileFriendsViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let test = self.nameSectionTitles[indexPath.row]
        performSegue(withIdentifier: "pf", sender: test)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ProfileFriendsViewController   {
            let selectedRow = TableView.indexPathForSelectedRow!
            let section = nameSectionTitles[selectedRow.section]
            if let nameValues = nameDict[section] {
                destination.itemUpdate = nameValues[selectedRow.row]
            }
        }
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return nameSectionTitles
    }
}
    
    


 
