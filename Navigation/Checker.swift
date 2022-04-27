//
//  Checker.swift
//  Navigation
//
//  Created by Dany on 27.04.2022.
//

import Foundation
import UIKit

class Checker {
    static let shared = Checker()
    func logInCheck(logIn: String, password: String) -> Bool {
        if self.logIn == logIn && self.password == password {
            return true
        }
        return false
    }
    private let logIn = "King Lion"
    private let password = "1"
}
