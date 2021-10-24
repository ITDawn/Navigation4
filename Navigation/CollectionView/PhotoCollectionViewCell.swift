//
//  CollectionViewCell.swift
//  Navigation
//
//  Created by Dany on 17.09.2021.
//

import UIKit
import StorageService

class PhotoCollectionViewCell: UICollectionViewCell {
    var photo: CollectionPhoto? {
        didSet {
            photoImageView.image = photo?.image
        }
    }
    
    
    
    var photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .black
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
extension PhotoCollectionViewCell {
    
    private func setupViews(){
        contentView.addSubview(photoImageView)
        
        let constraints = [
            
            photoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
