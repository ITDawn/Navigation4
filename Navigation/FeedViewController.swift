//
//  FirstViewController.swift
//  Navigation
//
//  Created by Dany on 27.07.2021.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1:UIButton = {
            let button = UIButton()
            button.setTitle("Post", for: .normal)
            button.backgroundColor = .lightGray
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            return button
        }()
                      view.addSubview(button1)
        let button2: UIButton = {
            let button = UIButton()
            button.setTitle("Post Information", for: .normal)
            button.layer.cornerRadius = 10
            button.backgroundColor = .darkGray
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            return button
        }()
              view.addSubview(button2)
       
        let stackView = UIStackView(arrangedSubviews: [button1,button2])
        stackView.axis = .vertical
        stackView.spacing = 10
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])

        
        self.title = "Feed"
    }
    
    @objc func tap() {
        let vc = PostViewController()
        vc.view.backgroundColor = .cyan
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
