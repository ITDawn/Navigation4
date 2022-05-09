//
//  CustomButton.swift
//  Navigation
//
//  Created by Dany on 04.05.2022.
//

import Foundation
import UIKit

struct CustomButtonModel {
    let title: String
}


final class CustomButton: UIButton {
    var complition: (() -> Void)?
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .light)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(primaryLabel)
        primaryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        primaryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        layer.cornerRadius = 20
        backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(tap), for: .touchUpInside)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func configure(model: CustomButtonModel, completion: @escaping () -> Void, shadow: Bool) {
        primaryLabel.text = model.title
        self.complition = completion
        if shadow == true {
            layer.shadowOffset = CGSize(width: 4, height: 4)
            layer.shadowRadius = 4
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.7
        }
    }
    
    @objc func tap() {
       complition?()
     }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
