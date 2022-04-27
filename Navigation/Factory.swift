//
//  File.swift
//  Navigation
//
//  Created by Dany on 02.11.2021.
//

import Foundation
import UIKit

protocol LogInFactory {
    func createLogIn() -> LogInInspector
}

class MyLogInFactory: LogInFactory {
    func createLogIn() -> LogInInspector {
        let logInInspector = LogInInspector()
        return logInInspector
    }
}
