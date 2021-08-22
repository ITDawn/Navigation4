//
//  LoginViewController.swift
//  Navigation
//
//  Created by Dany on 18.08.2021.
//

import UIKit

class LogInViewController: UIViewController {
    let logInview = LogInHeaderView()

    let scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInview.translatesAutoresizingMaskIntoConstraints = false
        
       
        self.view.addSubview(scrollView)
        scrollView.addSubview(logInview)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2000)
        logInview.button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        print(scrollView.bounds)

        NSLayoutConstraint.activate([
            
            scrollView.heightAnchor.constraint(equalToConstant: 2000),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            logInview.widthAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.widthAnchor),
            logInview.topAnchor.constraint(equalTo: scrollView.topAnchor),
            logInview.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            logInview.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            logInview.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            logInview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)

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
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        
    }
    
    
    @objc func tap() {
        let vc = ProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
