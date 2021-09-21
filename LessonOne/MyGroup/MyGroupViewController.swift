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
    
    @IBAction func addGroup(segue: UIStoryboardSegue){
        
    
        if segue.identifier == "addGroup" {
            guard let allGroupCntroller = segue.source as? AllGroupViewController else { return }
            if let indexPath = allGroupCntroller.tableView.indexPathForSelectedRow {
                let groupp = allGroupCntroller.displayGroup[indexPath.row]
//                if dispayGroupMy.contains(displayGroup)
//                {
                    dispayGroupMy.append(groupp)
                    tableViewMy.reloadData()
//                }
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
}
