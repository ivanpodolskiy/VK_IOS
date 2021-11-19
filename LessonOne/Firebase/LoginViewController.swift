//
//  LoginViewController.swift
//  LessonOne
//
//  Created by user on 17.11.2021.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
   private let authService = Auth.auth()
   
    private var token: AuthStateDidChangeListenerHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        token = authService.addStateDidChangeListener{ auth, user in
            
            //если есть юзер занчит авторизованы
            guard user != nil else { return }
            self.showeHomeVC()
        }

    }

    @IBAction func singInActionButton(_ sender: Any?) {
        
        guard let email = emailTextField.text, emailTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText
        else {
            showAlert(titile: "Ошибка клиентская", text: "Логин или пароль не введены")
            return
        }
        
       
        authService.signIn(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                self.showAlert(titile: "Ошибка Firebase", text: error.localizedDescription)
                return
            }
            self.showeHomeVC()
        }
    }
    
    
    @IBAction func singUpActionButton(_ sender: Any) {
        
        guard let email = emailTextField.text, emailTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText
        else {
            showAlert(titile: "Ошибка клиентская", text: "Логин или пароль не введены")
            return
        }
        
        authService.createUser(withEmail: email, password: password) {  authResult, error in
            if let error = error {
                self.showAlert(titile: "Ошибка Firebase", text: error.localizedDescription)
                return
            }
            self.singInActionButton(nil)
        }
        }
            
            
  
    
    
    //MARK: - Private
    
    private func showeHomeVC() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") else {return}
        
        guard let window = self.view.window else { return }
        window.rootViewController = vc
    }
    
    private func showAlert(titile: String, text: String) {
        
        let alert = UIAlertController(title: titile, message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
