//
//  SecondViewController.swift
//  Navigation
//
//  Created by Dany on 27.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let myView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cellID = "cellID"
    
    let idCell = "idCell"
    let headerCell = "head"
    
    private let tableView:UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.addSubview(myView)
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            
            myView.heightAnchor.constraint(equalTo: view.heightAnchor),
            myView.widthAnchor.constraint(equalToConstant: 414),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 280),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My profile"
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    private enum Section {
        case Photo, Posts, Unknown
        
        init(section: Int){
            switch section {
            case 0:
                self = .Photo
            case 1:
                self = .Posts
            default:
                self = .Unknown
                
            }
        }
    }
    
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    @objc func tap() {
        let vc = LogInViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if (section == 0) {
//            return myView
//        }
//        return nil
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photos = PhotosViewController()
        photos.title = "Photos"
        if indexPath.section == 0 {
            self.navigationController?.pushViewController(photos, animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch  Section(section: indexPath.section) {
        case .Photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! PhotosTableViewCell
            cell.photo = Storage.tableModel[0].photos[indexPath.row]
            return cell
        case .Posts:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
            cell.post = Storage.tableModel[0].posts[indexPath.row]
            return cell
        case .Unknown:
            return UITableViewCell()
            
        }
    }
    
    
    
}

