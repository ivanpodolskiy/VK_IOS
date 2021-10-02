//
//  FriendsViewController.swift
//  LessonOne
//
//  Created by user on 17.09.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TableView.register(R.Nib.friendsNib, forCellReuseIdentifier: R.cell.friendsCell)
        self.getDate()
        
//        self.appleyShadowView(viewView)
    }
    
//  var viewView = ViewFriends()
//
//
//    func appleyShadowView(_ view: UIView) {
//        view.layer.cornerRadius = 32
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 1
//        view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        view.layer.shadowRadius = 5
//
//
//        view.layer.masksToBounds = false
//
//    }
    
    
    private var displayIthem: [DisplayItem] = []
    
    private func getDate(){
        let mocItems: [DisplayItem] = [
            .init(name: " Morty", avatar: #imageLiteral(resourceName: "mmortyy")),
            .init(name: "Shrimp Morty", avatar: #imageLiteral(resourceName: "MortyShrimp")),
            .init(name: "Rick", avatar: #imageLiteral(resourceName: "Rick")),
            .init(name: "Birdperson", avatar: #imageLiteral(resourceName: "birdperson-"))]
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.displayIthem = mocItems
                self.TableView.reloadData()
                
                
            }
    }
    
    
//    func createNamesDict() {
//        for nam in displayIthem.name {
//            
//            
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pf" {
            let vcv = segue.destination as! ProfileFriendsViewControllers
            vcv.display = sender as? DisplayItem
    }
     }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayIthem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        TableView.dequeueReusableCell(withIdentifier: R.cell.friendsCell, for: indexPath)
    }
    
    
}

extension FriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? FirendsTableViewCell)?.configure(with: self.displayIthem[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.displayIthem.remove(at: indexPath.row)
            self.TableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let viewController = storyboard?.instantiateViewController(withIdentifier: "pf") as! ProfileFriendsViewControllers
//        viewController.namee.text = self.displayIthem
//
//           viewController.fileName = self.fileName
//
//           self.present(viewController,animated:true)
        let test = self.displayIthem[indexPath.row]
        
        performSegue(withIdentifier: "pf", sender: test)

    }
    }


