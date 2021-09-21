//
//  SecondViewController.swift
//  Navigation
//
//  Created by Dany on 27.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    let storage = Storage.tableModel
    let cellID = "cellID"
    let profileID = "Profile"
    let idCell = "idCell"
    
    private let tableView:UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: -10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 10),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My profile"
        view.backgroundColor = .systemGray5
        tableView.backgroundColor = .systemGray5
        tableView.separatorColor = .darkGray
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private enum Section {
        case Profile, Photo, Posts, Unknown
        
        init(section: Int){
            switch section {
            case 0:
                self = .Profile
            case 1:
                self = .Photo
            case 2:
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
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: profileID)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    @objc func tap() {
        let vc = LogInViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let photos = PhotosViewController()
        photos.title = "Photo Gallery"
        if indexPath.section == 1 {
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
            return 1
        case 2:
            return storage[0].posts.count
        default:
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch  Section(section: indexPath.section) {
        case .Profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: profileID, for: indexPath) as! ProfileTableViewCell
            return cell
        case .Photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! PhotosTableViewCell
            cell.photo = storage[0].photos[indexPath.row]
            return cell
        case .Posts:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
            cell.post = storage[0].posts[indexPath.row]
            cell.separatorInset.left = 10
            cell.separatorInset.right = 10
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        case .Unknown:
            return UITableViewCell()
            
        }
    }
}

