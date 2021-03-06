//
//  LoginViewController.swift
//  Navigation
//
//  Created by Dany on 18.08.2021.
//

import UIKit

public var logInName: String?

protocol LogInViewControllerDelegate {
    func logInCheck(logIn: String, password: String) -> Bool
}

class LogInViewController: UIViewController {
    
    var logIn: LogInViewControllerDelegate?
//    func logInCheck() {
//        let vc = ProfileViewController()
//        if userNameText.text == logIn && passwordText.text == password {
//            self.navigationController?.pushViewController(vc, animated: true)
//            self.dismiss(animated: true)
//        } else {
//            let alert = UIAlertController(title: "Wrong Username", message: nil, preferredStyle: .alert)
//            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
//            alert.addAction(cancelAction)
//            self.present(alert, animated: true)
//        }
//    }
//
    let contentView = UIView()
    
    let button = CustomButton()
   
    

    
    let logoImage:UIImageView = {
        let logo = UIImageView(image: UIImage(named: "log"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
   public let userNameText = CustomTextField()
   public let passwordText = CustomTextField()

//
//   public let passwordText: UITextField = {
//        let textField = UITextField()
//        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
//        textField.leftView = paddingView
//        textField.leftViewMode = .always
//        textField.placeholder = "Password"
//        textField.textColor = .black
//        textField.clipsToBounds = true
//        textField.backgroundColor = .systemGray6
//        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//        textField.layer.cornerRadius = 10
//        textField.layer.borderWidth = 0.5
//        textField.layer.borderColor = UIColor.lightGray.cgColor
//        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        textField.isSecureTextEntry = true
//        textField.autocapitalizationType = .none
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
    
    
    let scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
        userNameText.configure(holder: "Email", maskCorners: .Up, hidenText: false)
        passwordText.configure(holder: "Password", maskCorners: .Down, hidenText: true)
      
        button.configure(model: CustomButtonModel(title: "Log in"), completion: tap, shadow: false)
        contentView.addSubview(logoImage)
        contentView.addSubview(userNameText)
        contentView.addSubview(passwordText)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            userNameText.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            userNameText.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userNameText.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            userNameText.heightAnchor.constraint(equalToConstant: 50),
            
            passwordText.topAnchor.constraint(equalTo: userNameText.bottomAnchor),
            passwordText.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordText.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordText.heightAnchor.constraint(equalToConstant: 50),
            
            button.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height + 10
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 10, right: 0)
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        
    }
    @objc func tap() {
        logInName = userNameText.text
        guard let logIn = logIn else { return }
        if  logIn.logInCheck(logIn: userNameText.text ?? "", password: passwordText.text ?? "")  {
                let profile = ProfileViewController()
                self.navigationController?.pushViewController(profile, animated: true)
        } else {
            let alert = UIAlertController(title: "Wrong Username", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        }
    }
}
