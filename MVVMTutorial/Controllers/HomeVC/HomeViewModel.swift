//
//  HomeViewModel.swift
//  MVVMTutorial
//
//  Created by MacBook Pro on 02/04/2024.
//

import Foundation

class HomeViewModel {
    var email: String = ""
    var password: String = ""
    weak var sceneDLG: SceneDLGProtocol?
    
    func fetchData(completion: (Bool, String, String) -> ()) {
        let data = DataManager.shared().read()
        let email = data.0
        let password = data.1
        
        if email != "" || password != "" {
            self.email = email
            self.password = password
            
            completion(true, email, password)
        } else {
            completion(false, "", "")
        }
    }
    
    func resetPassoword(passwor: String) {
        UserDefaults.standard.set(passwor, forKey: "password")
    }
    
    func logout() {
        self.sceneDLG?.changeView(typeScreen: .login)
    }
}
