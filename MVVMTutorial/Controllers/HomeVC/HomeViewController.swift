//
//  HomeViewController.swift
//  MVVMTutorial
//
//  Created by MacBook Pro on 28/03/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var resetPasswordTextField: UITextField!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "home"
        fetchData()
    }
    
    private func updateUI() {
        emailLabel.text = viewModel.email
    }
    
    func fetchData() {
        viewModel.fetchData { (done, email, password) in
            if done {
                self.updateUI()
            } else {
                debugPrint("Loi")
            }
        }
    }
    
    @IBAction func tapResetPassword(_ sender: Any) {
        if let text = resetPasswordTextField.text {
            let password: String = text
            if (password != "") {
                debugPrint(password)
                viewModel.resetPassoword(passwor: password)
                let alert = UIAlertController(title: "Success", message: "reset MK thanh cong", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func tapLogout(_ sender: Any) {
        self.viewModel.logout()
    }
    
    
}
