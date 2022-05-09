//
//  FirstViewController.swift
//  Navigation
//
//  Created by Dany on 27.07.2021.
//

import UIKit

class FeedViewController: UIViewController {
    let checkButton = CustomButton()
    let checkTextField = CustomTextField()
    
    let testLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Check"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    let checkModel: CheckModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.configure(model: CustomButtonModel(title: "Check"), completion: check, shadow: true)
        checkTextField.configure(holder: "Check word", maskCorners: .None, hidenText: false)
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
        
        let stackView = UIStackView(arrangedSubviews: [testLabel,checkTextField, checkButton,button1,button2])
        stackView.axis = .vertical
        stackView.spacing = 10
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            checkButton.heightAnchor.constraint(equalToConstant: 45),
            checkTextField.heightAnchor.constraint(equalToConstant: 30),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
        self.title = "Feed"
    }
    init(checkModel: CheckModel) {
        self.checkModel = checkModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func check() {
        if ((checkTextField.text?.isEmpty) != nil) && checkModel.checkWord(word: checkTextField.text ?? "error") {
                testLabel.textColor = .green
            } else {
                testLabel.textColor = .red
            }
    }
    @objc func tap() {
        let vc = PostViewController()
        vc.view.backgroundColor = .cyan
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
