//
//  ViewController.swift
//  LessonOne
//
//  Created by user on 04.09.2021.
//

import UIKit

class ViewController: UIViewController {
   
   
    @IBOutlet private weak var scrolView: UIScrollView!
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObserver()
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrolView.addGestureRecognizer(gesture)
    }
    
    @objc func handleGesture(){
        self.scrolView.endEditing(true)
    }
    
    private func addObserver() {
        //Подпишемся на уведмоления
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObserver() {
        //отпишемся от уведомлений
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func handleKeyboardWillShow() {
        self.scrolView.contentInset.bottom += 140
    }
    
    @objc private func handleKeyboardWillHide() {
        self.scrolView.contentInset.bottom = 0
         
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Неверные данные для входа", preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction private func onButtonPressed(_ sender: Any) {
       
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        
        if login == ("1") && password == ("1") {
            let tabBarController = self.storyboard?.instantiateViewController(identifier: "tb") as! TabBarContorller
            present(tabBarController, animated: true, completion: nil)
        }  else {
            self.showAlert()
        }
        
        
     
    }
}
