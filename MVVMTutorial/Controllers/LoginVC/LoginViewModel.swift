//
//  LoginViewModel.swift
//  MVVMTutorial
//
//  Created by MacBook Pro on 28/03/2024.
//

import Foundation

enum LoginResult {
    case success
    case failure (Bool, String)
}

final class LoginViewModel {
    
    typealias Completion = (LoginResult) -> Void
    
    var email: Observer<String> = Observer(value: "")
    var password: Observer<String> = Observer(value: "")
    
    init() {
        self.email.value = UserDefaults.standard.string(forKey: "email") ?? ""
        self.password.value = UserDefaults.standard.string(forKey: "password") ?? ""
    }
    
    
    func login(email: String, password: String, completion: Completion) {
        if (email != UserDefaults.standard.string(forKey: "email") || password != UserDefaults.standard.string(forKey: "password")) {
            completion(.failure(true, "Mat khau hoac email trong"))
        } else {
            self.email.value = ""
            self.password.value = ""
            
            DataManager.shared().save(email: email, password: password)
            
            completion(.success)
        }
    }
}
