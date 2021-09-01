//
//  TableViewCell4.swift
//  Navigation
//
//  Created by Dany on 01.09.2021.
//

import UIKit

class TableViewCell4: UITableViewCell {

    var deviceImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pukin"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()

    var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "vesti oficcial"
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    
    var descriptionLabel:UILabel = {
        let label = UILabel()
        label.text = "— Если вы имели возможность послушать то, что я говорил недавно в прямом эфире по телевидению, то знаете: я как раз против того, чтобы поднимать пенсионный возраст. И повторяю – пока я президент, это решение не будет принято."
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        return label
    }()
    
    
    
    
    var likesLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Likes: -437"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    var viewsLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Views: 12020"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setupViews()
    }
    
}
extension TableViewCell4 {
    private func setupViews(){
        contentView.addSubview(deviceImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)

        let constraints = [

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            deviceImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            deviceImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            deviceImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: deviceImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),


        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
