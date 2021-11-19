//
//  HomeViewController.swift
//  LessonOne
//
//  Created by user on 17.11.2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
 
    let ref = Database.database().reference(withPath: "cities") // ссылка на контейнер в Fierbase
    
   let authService = Auth.auth()
    
    
    
    @IBAction func singOutActionButton(_ sender: Any) {
        
        try? authService.signOut()
        showLoginVC()
        
    }
    
    
    @IBAction func addCityActionButton(_ sender: Any) {
       
        let alert = UIAlertController(title: "Добавить город", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let save = UIAlertAction(title: "Сохранить", style: .default) {
            _ in
            
            guard let textField = alert.textFields?.first,
                  let cityName = textField.text else { return }
            
                //готовим модель 
            let city = CityFirebase(name: cityName, zipcode: Int.random(in: 100000...999999))
            
            //готовим контейнер для сохранения
            let cityContainerRef = self.ref.child(cityName)
            
            //Сохранение в контейнер
            cityContainerRef.setValue(city.toAnyObject())
        }
        
        alert.addTextField()
        alert.addAction(cancel)
        alert.addAction(save)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    //MARK: - Private
    
   private func showLoginVC() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else {return}
        
        guard let window = self.view.window else { return }
        window.rootViewController = vc
    }
    
}
