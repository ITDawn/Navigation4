//
//  SecondViewController.swift
//  Navigation
//
//  Created by Dany on 27.07.2021.
//

import UIKit
import SnapKit
import StorageService

class ProfileViewController: UIViewController {
    private var text: String?
    let viewForTable: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    let buttonX: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.imageView?.tintColor = .systemGray2
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
        return button
    }()

    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "King Lion"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.layer.cornerRadius = 14
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Into the wild"
        label.font = UIFont.boldSystemFont(ofSize: 19)

        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let avatarImageView: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "Lion"))
        avatar.isUserInteractionEnabled = true
        avatar.layer.borderWidth = 5
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = 75
        avatar.clipsToBounds = true
        
       // avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    var statusTextField: UITextField = {
        var textField = UITextField()
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.placeholder = "Set the status"
        textField.clearButtonMode = .always
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let storage = Storage.tableModel
    let cellID = "cellID"
    let profileID = "Profile"
    let myCell = "MyCell"
    
    private let tableView:UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        #if DEBUG
        tableView.backgroundColor = .systemGreen
        #else
        tableView.backgroundColor = .systemGray5
        #endif
        self.setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.statusTextField.addTarget(self, action: #selector(statusChancged(textField:)), for: .editingChanged )
        self.title = "My profile"
        self.view.addSubview(tableView)
        buttonX.isHidden = true
        buttonX.frame = CGRect(x: self.view.frame.width - 66, y: 100, width: 50, height: 50)
        self.buttonX.addTarget(self, action: #selector(tappedX), for: .touchUpInside)
        avatarImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapp(tapGestureRecognizer:)))
        tapGesture.numberOfTouchesRequired = 1
        avatarImageView.addGestureRecognizer(tapGesture)
        avatarImageView.frame = CGRect(x: 16, y: 67, width: 150, height: 150)

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
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: profileID)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: myCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = .darkGray
        tableView.addSubview(avatarImageView)
        tableView.addSubview(fullNameLabel)
        tableView.addSubview(setStatusButton)
        tableView.addSubview(statusLabel)
        tableView.addSubview(statusTextField)
        tableView.addSubview(buttonX)
        view.addSubview(viewForTable)
//        avatarImageView.snp.makeConstraints { (make) -> Void in
//            make.width.height.equalTo(150)
//            make.top.equalToSuperview().inset(67)
//            make.left.equalToSuperview().inset(22)
//        }
        viewForTable.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        fullNameLabel.snp.makeConstraints{ (make) -> Void in
            make.height.equalTo(60)
            make.top.equalToSuperview().inset(67)
            make.left.equalTo(avatarImageView).inset(172)
            make.right.equalToSuperview().inset(22)
        }
        statusLabel.snp.makeConstraints {(make) -> Void in
            make.height.equalTo(30)
            make.top.equalTo(fullNameLabel).inset(62)
            make.left.equalTo(avatarImageView).inset(172)
            make.right.equalToSuperview().inset(22)
        }
        statusTextField.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(statusLabel).inset(46)
            make.left.equalTo(avatarImageView).inset(172)
            make.right.equalToSuperview().inset(22)
           make.height.equalTo(40)
        }
        setStatusButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(statusTextField).inset(64)
            make.left.equalToSuperview().inset(22)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.width.equalTo(tableView).inset(22)
            
        }
        tableView.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview().inset(-55)
            make.left.equalToSuperview().inset(-10)
            make.right.equalToSuperview().inset(-10)
            make.bottom.equalToSuperview()
        }
        buttonX.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview().inset(80)
            make.right.equalToSuperview().inset(40)
        }

    }
    // Анимация после нажатия на аватар
    @objc func avatarTapp(tapGestureRecognizer: UITapGestureRecognizer) {
       

        UIImageView.animateKeyframes(withDuration: 0.5, delay: 0, options: [],
                                     animations: {
                                        UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
//self.viewForTable.isHidden = false
                                            self.tableView.alpha = 0.5
                                            print("alpha table view is:\(self.tableView.alpha)")
                                            self.avatarImageView.contentMode = .scaleToFill
                                            self.avatarImageView.frame = CGRect(x: 26, y: 120, width: self.view.frame.width - 32, height: self.view.frame.height - 220)
                                            self.statusTextField.isHidden = true
                                            self.setStatusButton.isHidden = true
                                            self.fullNameLabel.isHidden = true
                                            self.statusLabel.isHidden = true
                                            
                                        }
                                     }, completion: {
                                        finished in
                                        
                                        UIImageView.animate(withDuration: 0.2) { [self] in
                                          
                                            self.buttonX.isHidden = false
                                            self.avatarImageView.layer.borderWidth = 0
                                            self.avatarImageView.layer.cornerRadius = 50
                                        }
                                     })
    }
    // функция на передачу текста в поле статус
    @objc private func buttonPressed() {
        statusLabel.text = text
        print("\(statusLabel.text ?? "Status clear")")
    }
    // прием текста из поля для текста
    @objc func statusChancged(textField: UITextField?) {
        text = textField?.text
    }
    
    // Функция возвращающая аватар в исходное положение по нажатию на Х
    @objc func tappedX() {
        
        UIImageView.animateKeyframes(withDuration: 0.5, delay: 0, options: [],
                                     animations: {
                                        self.tableView.alpha = 1

                                        UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                                            self.buttonX.isHidden = true
                                            self.avatarImageView.contentMode = .scaleToFill
                                            self.avatarImageView.frame = CGRect(x: 16, y: 67, width: 150, height: 150)
                                            self.avatarImageView.layer.borderWidth = 5
                                            self.avatarImageView.layer.cornerRadius = 75
                                        }
                                     }, completion: {
                                        finished in
                                        
                                        UIImageView.animate(withDuration: 0.5) { [self] in

                                            self.statusTextField.isHidden = false
                                            self.setStatusButton.isHidden = false
                                            self.fullNameLabel.isHidden = false
                                            self.statusLabel.isHidden = false
                                            

                                        }
                                     })
    }
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = .none
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
            let cell = tableView.dequeueReusableCell(withIdentifier: myCell, for: indexPath) as! MyTableViewCell
            cell.selectionStyle = .none
            return cell
        case .Posts:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
            cell.post = storage[0].posts[indexPath.row]
            cell.selectionStyle = .none
            cell.separatorInset.left = 10
            cell.separatorInset.right = 10
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        case .Unknown:
            return UITableViewCell()
            
        }
    }
}


