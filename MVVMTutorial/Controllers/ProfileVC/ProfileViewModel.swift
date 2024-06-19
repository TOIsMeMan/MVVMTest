//
//  ProfileViewModel.swift
//  MVVMTutorial
//
//  Created by MacBook Pro on 03/04/2024.
//

import Foundation

class ProfileViewModel {
    var name: Observer<String> = Observer(value: "")
    var age: Observer<String> = Observer(value: "")
    var height: Observer<String> = Observer(value: "")
    var weight: Observer<String> = Observer(value: "")
    
    func updateData() {
        self.name.value = "Phan Thi Huyen Anh"
        self.age.value = "20"
        self.height.value = "165 cm"
        self.weight.value = "40 kg"
    }
    
    init() {
        self.name.value = UserDefaults.standard.string(forKey: "name") ?? ""
        self.age.value = UserDefaults.standard.string(forKey: "age") ?? ""
        self.height.value = UserDefaults.standard.string(forKey: "height") ?? ""
        self.weight.value = UserDefaults.standard.string(forKey: "weight") ?? ""
    }
}
