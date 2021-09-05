//
//  CollectionViewCell.swift
//  Navigation
//
//  Created by Dany on 17.09.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var photo: Photo? {
        didSet {
            PhotoImageView.image = photo?.image
            PhotoImageView2.image = photo?.image2
            PhotoImageView3.image = photo?.image3
            PhotoImageView4.image = photo?.image4
        }
        }

   
   
    var PhotoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    var PhotoImageView2:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    var PhotoImageView3:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    var PhotoImageView4:UIImageView = {
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
extension PhotoCollectionViewCell {
   
    private func setupViews(){
        contentView.addSubview(PhotoImageView)
        contentView.addSubview(PhotoImageView2)
        contentView.addSubview(PhotoImageView3)
        contentView.addSubview(PhotoImageView4)

        
        let constraints = [
           
            PhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            PhotoImageView.widthAnchor.constraint(equalToConstant: 200),
            PhotoImageView.heightAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            PhotoImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            PhotoImageView.trailingAnchor.constraint(equalTo: PhotoImageView2.leadingAnchor, constant: -12),
            
            PhotoImageView2.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            PhotoImageView2.widthAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView2.heightAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView2.leadingAnchor.constraint(equalTo: PhotoImageView.trailingAnchor, constant: 12),
            PhotoImageView2.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            PhotoImageView2.trailingAnchor.constraint(equalTo: PhotoImageView3.leadingAnchor, constant: -12),

            PhotoImageView3.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            PhotoImageView3.widthAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView3.heightAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView3.leadingAnchor.constraint(equalTo: PhotoImageView2.trailingAnchor, constant: 12),
            PhotoImageView3.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            PhotoImageView3.trailingAnchor.constraint(equalTo: PhotoImageView4.leadingAnchor, constant: -12),
            
            PhotoImageView4.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            PhotoImageView4.widthAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView4.heightAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView4.leadingAnchor.constraint(equalTo: PhotoImageView3.trailingAnchor, constant: 12),
            PhotoImageView4.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            PhotoImageView4.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12),

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
