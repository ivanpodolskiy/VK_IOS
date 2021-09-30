//
//  ProfileViewController.swift
//  LessonOne
//
//  Created by user on 12.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {
   
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    func actionExit() {
        let exit = self.storyboard?.instantiateViewController(identifier: "VCOne") as! ViewController
        self.view.window?.rootViewController = exit
        present(exit, animated: true, completion: nil)
    }
    @IBAction func ExitButton(_ sender: Any) {
        actionExit()
        
    }
}
