//
//  SecondViewController.swift
//  Navigation
//
//  Created by Dany on 27.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    var cellId = ["cellId","cellId2","cellId3","cellId4"]
    


    let myView = ProfileHeaderView()
    
    let tableView = UITableView(frame: .zero, style: .plain)
 
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellId[0])
        tableView.register(TableViewCell2.self, forCellReuseIdentifier: cellId[1])
        tableView.register(TableViewCell3.self, forCellReuseIdentifier: cellId[2])
        tableView.register(TableViewCell4.self, forCellReuseIdentifier: cellId[3])

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


extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier:  cellId[0], for: indexPath)
        } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier:  cellId[1], for: indexPath)
        } else if indexPath.section == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier:  cellId[2], for: indexPath)
        } else if indexPath.section == 3 {
            cell = tableView.dequeueReusableCell(withIdentifier:  cellId[3], for: indexPath)
        }
 
    return cell
        
    }

}
