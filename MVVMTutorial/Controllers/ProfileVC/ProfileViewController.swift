//
//  ProfileViewController.swift
//  MVVMTutorial
//
//  Created by MacBook Pro on 28/03/2024.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "profile"
        setBinding()
    }
    
    func setBinding() {
        viewModel.name.bind { name in
            self.nameLabel.text = String(name)
        }
        
        viewModel.age.bind { age in
            self.ageLabel.text = String(age)
        }
        
        viewModel.height.bind { height in
            self.heightLabel.text = String(height)
        }
        
        viewModel.weight.bind { weight in
            self.weightLabel.text = String(weight)
        }
    }

    @IBAction func tapUpdateData(_ sender: Any) {
        self.viewModel.updateData()
    }
    
}
