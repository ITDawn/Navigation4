//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Dany on 13.09.2021.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    
    var photo: Photo? {
        didSet {
            PhotoImageView.image = photo?.image
            titleLabel.text = photo?.label
            PhotoImageView2.image = photo?.image2
            PhotoImageView3.image = photo?.image3
            PhotoImageView4.image = photo?.image4
        }
        }

    var strelka:UIImageView = {
        let strelka = UIImageView()
        
        
        strelka.translatesAutoresizingMaskIntoConstraints = false
        strelka.image = UIImage(systemName: "arrow.forward")
        strelka.tintColor = .black
        
        return strelka
    }()
   
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
    
    var titleLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
       
        
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
    
}
extension PhotosTableViewCell {
   
    private func setupViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(strelka)
        contentView.addSubview(PhotoImageView)
        contentView.addSubview(PhotoImageView2)
        contentView.addSubview(PhotoImageView3)
        contentView.addSubview(PhotoImageView4)

        
        let constraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 12),
            
            strelka.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            strelka.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            

            PhotoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            PhotoImageView.heightAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            PhotoImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            PhotoImageView.trailingAnchor.constraint(equalTo: PhotoImageView2.leadingAnchor, constant: -12),
            
            PhotoImageView2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            PhotoImageView2.widthAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView2.heightAnchor.constraint(equalTo: PhotoImageView.widthAnchor),

            PhotoImageView2.leadingAnchor.constraint(equalTo: PhotoImageView.trailingAnchor, constant: 12),
            PhotoImageView2.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            PhotoImageView2.trailingAnchor.constraint(equalTo: PhotoImageView3.leadingAnchor, constant: -12),

            PhotoImageView3.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            PhotoImageView3.widthAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView3.heightAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView3.leadingAnchor.constraint(equalTo: PhotoImageView2.trailingAnchor, constant: 12),
            PhotoImageView3.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            PhotoImageView3.trailingAnchor.constraint(equalTo: PhotoImageView4.leadingAnchor, constant: -12),
            
            PhotoImageView4.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            PhotoImageView4.widthAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView4.heightAnchor.constraint(equalTo: PhotoImageView.widthAnchor),
            PhotoImageView4.leadingAnchor.constraint(equalTo: PhotoImageView3.trailingAnchor, constant: 12),
            PhotoImageView4.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            PhotoImageView4.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12),

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    
}
