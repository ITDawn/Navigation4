//
//  SecondViewController.swift
//  Navigation
//
//  Created by Dany on 27.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    let myView = ProfileHeaderView()
    let logIn = LogInHeaderView()
    override func viewWillLayoutSubviews() {
        self.view.addSubview(myView)
        self.view.addSubview(logIn)
        logIn.backgroundColor = .white
        myView.backgroundColor = .lightGray
        myView.translatesAutoresizingMaskIntoConstraints = false
        let viewHeight = myView.heightAnchor.constraint(equalTo: view.heightAnchor)
        let viewWidth = myView.widthAnchor.constraint(equalToConstant: 414)
        let trailingAnchor = myView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let leadingAnchor = myView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        logIn.isHidden = true
      
        myView.logOutButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        NSLayoutConstraint.activate([viewHeight, trailingAnchor, leadingAnchor, viewWidth])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My profile"
    }
    @objc func tap() {
        let vc = LogInViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

