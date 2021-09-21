//
//  CollectionViewCell.swift
//  Navigation
//
//  Created by Dany on 17.09.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var photo: CollectionPhoto? {
        didSet {
            PhotoImageView.image = photo?.image
        }
    }
    
    
    
    var PhotoImageView:UIImageView = {
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
        contentView.addSubview(PhotoImageView)
        
        
        
        let constraints = [
            
            PhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            PhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            PhotoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            PhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
