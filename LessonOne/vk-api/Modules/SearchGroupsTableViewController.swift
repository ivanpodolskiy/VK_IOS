//
//  SearchGroupsTableViewController.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import UIKit

class SearchGroupsTableViewController: UITableViewController {

    let searchGropsService = SearchGropsAPI()
    
<<<<<<< Updated upstream
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchGropsService.searchGroups { group in
            print ("получили группы из поиска в контроллере")
=======
    var searchGroup: [SearchGropsJSON] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        searchGropsService.searchGroups { searchGroup in
            
            
            print ("получили группы из поиска в контроллере")
            self.searchGroup = searchGroup
            self.tableView.reloadData()
         
>>>>>>> Stashed changes
        }
    }

    // MARK: - Table view data source

<<<<<<< Updated upstream
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
=======
 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return searchGroup.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let itemSeachGroup = searchGroup[indexPath.row]
        
        let url = URL(string: itemSeachGroup.photo50)
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }
        cell.textLabel?.text = itemSeachGroup.name
        return cell
    }
>>>>>>> Stashed changes

}
