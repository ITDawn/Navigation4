//
//  InfoViewController.swift
//  Navigation
//
//  Created by Dany on 28.07.2021.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button: UIButton = {
            let button = UIButton(frame: CGRect(x: 90, y: 350, width: 200, height: 50))
            button.center = self.view.center
            button.setTitle("Info", for: .normal)
            button.backgroundColor = .black
            button.addTarget(self, action: #selector(alert), for: .touchUpInside)
            return button
        }()
        view.addSubview(button)
        
    }
    
    @objc func alert(_ sender: Any) {
        let alertVc = UIAlertController(title: "Error", message: "Nowhere to go", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            print("Вы никуда не ушли")
        }
        let action2 = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("Действие отменено")
        }
        alertVc.addAction(action)
        alertVc.addAction(action2)
        self.present(alertVc, animated: true, completion: nil)
        
    }
}
