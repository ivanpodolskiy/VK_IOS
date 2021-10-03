//
//  MyGroupViewController.swift
//  LessonOne
//
//  Created by user on 20.09.2021.
//

import UIKit

class MyGroupViewController: UIViewController {
//
    
    @IBOutlet weak var tableViewMy: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func showAlertGroup() {
        let alert = UIAlertController(title: "ОЙ", message: "Вы уже состоите в данной группе ", preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }
     
    
    
    
    @IBAction func addGroup(segue: UIStoryboardSegue){
        
    
        if segue.identifier == "addGroup" {
            guard let allGroupCntroller = segue.source as? AllGroupViewController else { return }
            
            
            if allGroupCntroller.fillterNames .isEmpty {
                if let indexPath = allGroupCntroller.tableView.indexPathForSelectedRow {
                    let displayGroup = allGroupCntroller.displayGroup[indexPath.row]
                    
                    if dispayGroupMy.contains(displayGroup) {
                        print (1)
                        showAlertGroup()
                    } else {
                        print (2)
                        dispayGroupMy.append(displayGroup)
                        tableViewMy.reloadData()
                    }
                }
            } else {
            
                    if let indexPath = allGroupCntroller.tableView.indexPathForSelectedRow {
                        let fillterNames = allGroupCntroller.fillterNames[indexPath.row]
                        
                        if dispayGroupMy.contains(fillterNames) {
                            print (1)
                            showAlertGroup()
                        } else {
                            print (2)
                            dispayGroupMy.append(fillterNames)
                            tableViewMy.reloadData()
                        }
                    }
                    
                
            }
            
        }
        }
    


    
    var dispayGroupMy: [DisplayGroup] = []
    
    
}

extension MyGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dispayGroupMy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "MGC", for: indexPath) as! MyGroupCell
    }
}

extension MyGroupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? MyGroupCell)?.config(with: self.dispayGroupMy[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.dispayGroupMy.remove(at: indexPath.row)
            self.tableViewMy.deleteRows(at: [indexPath], with: .automatic)

        default:
            break
        }
    }
}
