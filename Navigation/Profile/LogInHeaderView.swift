//
//  LogInHeaderView.swift
//  Navigation
//
//  Created by Dany on 18.08.2021.
//

import UIKit

class LogInHeaderView: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let logoImage:UIImageView = {
        let logo = UIImageView(image: UIImage(named: "log"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
   
    let userNameText: UITextField = {
        let textField = UITextField()
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.placeholder = "Email or phone"
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.clipsToBounds = true
        textField.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordText: UITextField = {
        let textField = UITextField()
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.clipsToBounds = true
        textField.backgroundColor = .systemGray6
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.addSubview(button)
        self.addSubview(logoImage)
        self.addSubview(userNameText)
        self.addSubview(passwordText)
      
        
        NSLayoutConstraint.activate([
            
            logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userNameText.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            userNameText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            userNameText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            userNameText.heightAnchor.constraint(equalToConstant: 50),
            
            passwordText.topAnchor.constraint(equalTo: userNameText.bottomAnchor, constant: 0),
            passwordText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            passwordText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            passwordText.heightAnchor.constraint(equalToConstant: 50),

            
            button.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50)
            
        ])

}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
