//
//  ModalViewController.swift
//  Navigation
//
//  Created by Dany on 27.07.2021.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Post"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(tap))

    
    }
    @objc func tap() {
        let vc = InfoViewController()
        vc.view.backgroundColor = .green
        vc.title = "Info"
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        let vcNav = UINavigationController(rootViewController: vc)
        self.present(vcNav, animated: true, completion: nil)
        
    }

}
