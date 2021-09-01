//
//  TableViewCell2.swift
//  Navigation
//
//  Created by Dany on 01.09.2021.
//

import UIKit

class TableViewCell2: UITableViewCell {

        var deviceImageView:UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "rick"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = .black
            return imageView
        }()

        var titleLabel:UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Rick & Morty"
            label.contentMode = .scaleAspectFit
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            return label
        }()
        
        
        
        var descriptionLabel:UILabel = {
            let label = UILabel()
            label.text = "Жанр: мультфильм, комедия, фантастика. Режиссёр: Уэсли Арчер, Пит Мишелс. В ролях: Джастин Ройланд, Крис Парнелл, Спенсер Грэммер. В центре сюжета - школьник по имени Морти и его дедушка Рик."
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
            label.text = "Likes: 1096"
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            return label
        }()
        
        var viewsLabel:UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.text = "Views: 3220"
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
    extension TableViewCell2 {
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

