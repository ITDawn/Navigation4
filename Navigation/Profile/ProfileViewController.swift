//
//  SecondViewController.swift
//  Navigation
//
//  Created by Dany on 27.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let myView = ProfileHeaderView()
    let cellID = "cellID"
    private let tableView:UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
 
    override func viewWillLayoutSubviews() {
        self.view.addSubview(myView)
        self.view.addSubview(tableView)
        myView.backgroundColor = .systemGray6
        myView.translatesAutoresizingMaskIntoConstraints = false
        let viewHeight = myView.heightAnchor.constraint(equalTo: view.heightAnchor)
        let viewWidth = myView.widthAnchor.constraint(equalToConstant: 414)
        let trailingAnchor = myView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let leadingAnchor = myView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
      
        NSLayoutConstraint.activate([viewHeight, trailingAnchor, leadingAnchor, viewWidth])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My profile"
        setupTableView()
        setupConstraints()
        
    }
    
    
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 280),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    @objc func tap() {
        let vc = LogInViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        cell.post = Storage.arrayOfPosts[indexPath.row]
           return cell
}

}

