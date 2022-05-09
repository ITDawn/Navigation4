//
//  CustomTextField.swift
//  Navigation
//
//  Created by Dany on 06.05.2022.
//

import Foundation
import UIKit


final class CustomTextField: UITextField {
    enum Corners {
        case Up, Down, None
    }
   

    var clearHolder: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        leftView = paddingView
        leftViewMode = .always
        textColor = .black
        clipsToBounds = true
        backgroundColor = .systemGray6
        font = UIFont.systemFont(ofSize: 16, weight: .regular)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        clearButtonMode = .always
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        autocapitalizationType = .none
        delegate = self
    }
    
    
    func configure(holder: String, maskCorners: Corners, hidenText:Bool) {
        clearHolder = holder
        self.placeholder = holder
        if hidenText {
            isSecureTextEntry = true
        }
        switch maskCorners {
        case .Up:
           layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        case .Down:
            layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case .None:
            return
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.placeholder = ""
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.placeholder = clearHolder
    }
}
