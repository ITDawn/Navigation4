//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Dany on 21.09.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "King Lion"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.layer.cornerRadius = 14
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Into the wild"
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let avatarImageView: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "Lion"))
        avatar.layer.borderWidth = 5
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = 55
        avatar.clipsToBounds = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()

    var statusTextField: UITextField = {
        var textField = UITextField()
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.placeholder = "Set the status"
        textField.clearButtonMode = .always
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
   private var text: String?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.statusTextField.addTarget(self, action: #selector(statusChancged(textField:)), for: .editingChanged )

        setupViews()
    }
       
       required init?(coder: NSCoder) {
           super .init(coder: coder)
           setupViews()
       }
   }

   extension ProfileTableViewCell {
       private func setupViews(){
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(statusTextField)
        contentView.addSubview(setStatusButton)
        contentView.backgroundColor = .systemGray5
          

           let constraints = [
            
            avatarImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            
            fullNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 34),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
           ]
           
           NSLayoutConstraint.activate(constraints)
       }
    
    @objc
    private func buttonPressed() {

        statusLabel.text = text
        print("\(statusLabel.text ?? "Status clear")")

        }

    @objc func statusChancged(textField: UITextField?) {

        text = textField?.text

        }
 
}
