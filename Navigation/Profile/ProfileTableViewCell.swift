//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Dany on 21.09.2021.
//
import SnapKit
import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        contentView.backgroundColor = .systemGray5
      
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
      
    }
}
