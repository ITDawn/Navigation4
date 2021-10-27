//
//  MyCollectionViewCell.swift
//  Navigation
//
//  Created by Dany on 27.09.2021.
//

import UIKit
import StorageService

class MyCollectionViewCell: UICollectionViewCell {
    
    
    var photo: CollectionPhoto? {
        didSet {
            photoImageView.image = photo?.image
        }
    }
    var photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
    
}

extension MyCollectionViewCell {
    
    private func setupViews(){
        contentView.addSubview(photoImageView)
        let constraints = [
            
            photoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
