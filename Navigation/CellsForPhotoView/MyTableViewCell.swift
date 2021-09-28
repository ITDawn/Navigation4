//
//  MyTableViewCell.swift
//  Navigation
//
//  Created by Dany on 27.09.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    
    let identifier = "MyCell"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: MyCollectionViewCell.self))
        return collectionView
    }()
    
    var strelka:UIImageView = {
        let strelka = UIImageView()
        strelka.translatesAutoresizingMaskIntoConstraints = false
        strelka.image = UIImage(systemName: "arrow.forward")
        strelka.tintColor = .black
        
        return strelka
    }()
    
    
    
    var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private var tempStorage:[PhotoSection] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
    
}

extension MyTableViewCell {
    private func setupViews() {
        contentView.addSubview(collectionView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(strelka)
        
        
        self.tempStorage = PhotoStorage.photoModel
        
        let constraints = [
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 12),
            
            strelka.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            strelka.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            
            collectionView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension MyTableViewCell: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.tempStorage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.tempStorage[section].imageCollect.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCollectionViewCell.self), for: indexPath) as! MyCollectionViewCell
        cell.photo = self.tempStorage[indexPath.section].imageCollect[indexPath.row]
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.height / 2 + 26 , height: collectionView.frame.height / 2 + 45 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 12, bottom: 10, right: 12)
    }
}
