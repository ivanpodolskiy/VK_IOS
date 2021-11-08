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
    
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        animateFieldsAppearing()
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
        let alert = UIAlertController(title: "Ошибка", message: "Неверные данные для входа", preferredStyle: .actionSheet)
        let actionAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
     
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBAction private func onButtonPressed(_ sender: Any) {
       
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        
        if login == ("1") && password == ("1") {
            let tabBarController = self.storyboard?.instantiateViewController(identifier: "tb") as! TabBarContorller
            present(tabBarController, animated: true, completion: nil)
            
        }  else {
            anim()
            self.showAlert()
            
        }
        
    }
    
    
    
    func anim(){
        let animationKeyPath = "transform.translation.x"
        let shakeAnimation = "shake"
//        let duration = 0.5
        
        
        
        let animation = CAKeyframeAnimation(keyPath: animationKeyPath)
        animation.duration = 0.5
        animation.values = [-10.0, 10.0, -5.0, 5.0, -1.0, 1.0]
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        self.buttonOutlet.layer.add(animation, forKey: shakeAnimation)
    }
    
    
    //анимация
    func animateFieldsAppearing() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime() + 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.loginTextField.layer.add(animation, forKey: "opacity")
        self.passwordTextField.layer.add(animation, forKey: "opacity")
        self.passwordLabel.layer.add(animation, forKey:"opacity")
        self.loginLabel.layer.add(animation, forKey:"opacity")
        self.weatherLabel.layer.add(animation, forKey:"opacity")
        self.buttonOutlet.layer.add(animation, forKey: "opacity")
       
    }
}
