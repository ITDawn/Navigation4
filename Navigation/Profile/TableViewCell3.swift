//
//  TableViewCell3.swift
//  Navigation
//
//  Created by Dany on 01.09.2021.
//

import UIKit

class TableViewCell3: UITableViewCell {

   
    var deviceImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "jag"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()

    var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jaguar club"
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    
    var descriptionLabel:UILabel = {
        let label = UILabel()
        label.text = "Jaguar XF — люксовый седан бизнес-класса спортивный седан, выпускаемый британской автомобилестроительной компанией Jaguar с 2008 года. Является преемником Jaguar S-type."
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
        label.text = "Likes: 989"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    var viewsLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Views: 6567"
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
extension TableViewCell3 {
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
            deviceImageView.heightAnchor.constraint(equalToConstant: 450),
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
