//
//  LogInInspector.swift
//  Navigation
//
//  Created by Dany on 27.04.2022.
//

import Foundation
import UIKit

class LogInInspector:LogInViewControllerDelegate {
    func logInCheck(logIn: String, password: String) -> Bool {
        Checker.shared.logInCheck(logIn: logIn, password: password)
    }
}
