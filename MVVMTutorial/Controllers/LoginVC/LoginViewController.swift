//
//  LoginViewController.swift
//  MVVMTutorial
//
//  Created by MacBook Pro on 28/03/2024.
//

import UIKit

protocol abc: NSObject {
    
}

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    var observer: [abc] = []
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupUI() {
        self.title = "Login"
        updateView()
    }

    func setBindings() {
        viewModel.email.bind { email in
            self.emailTextField.text = String(email)
        }
        
        viewModel.password.bind { password in
            self.passwordTextFeild.text = String(password)
        }
    }
    
    private func setupData() {
        
    }
    
    func updateView() {
//        emailTextField.text = viewModel.email.value
//        passwordTextFeild.text = viewModel.password.value
    }
   
    @IBAction func tapLogin(_ sender: Any) {
        debugPrint("Login")
        let email = emailTextField.text ?? ""
        let password = passwordTextFeild.text ?? ""
        
        let complete: LoginViewModel.Completion = { (result) in
            switch result {
            case .success:
                debugPrint("Dang nhap thanh cong")
                self.updateView()
                
                let scene = UIApplication.shared.connectedScenes.first
                if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    sd.changeScreen(type: .tabbar)
                }
                
            case .failure(let isError, let errorMsg):
                debugPrint("Dang nhap that bai")
                debugPrint(errorMsg)
                let alert = UIAlertController(title: "Error", message: errorMsg, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        viewModel.login(email: email, password: password, completion: complete)
    }
    

}
