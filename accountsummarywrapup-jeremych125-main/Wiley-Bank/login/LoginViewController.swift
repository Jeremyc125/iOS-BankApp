//
//  ViewController.swift
//  Wiley-Bank
//
//  Created by user216422 on 3/21/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}


class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let errorLabel = UILabel()
    let signInButton = UIButton(type: .system)
    
    weak var delegate: LoginViewControllerDelegate?
    
    var userName: String?{
        return loginView.userNameTextField.text
    }
    var password: String?{
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            signInButton.configuration?.showsActivityIndicator = false
    }

}
extension LoginViewController{
    func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .primaryActionTriggered)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        errorLabel.textColor = .systemRed
        errorLabel.text = "Error Label"
        errorLabel.isHidden = true


    }
    
    func layout(){
        view.addSubview(loginView)
        view.addSubview(errorLabel)
        view.addSubview(signInButton)
        NSLayoutConstraint.activate([
            //our loginView's center will the center of the View's Center
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //our loginView's leading anchor will be the view's lead, + 8 (the multiplier is 8x)
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            //our view's trailing anchor will be +8 on the loginView's trailing anchor
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        NSLayoutConstraint.activate([
            //the top will be below the LongView's bottom
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            //the leading anchor will be the same as the loginView's leading anchor
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            //the trailing anchor will be the same as the loginView's trailing anchor
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 1),
            errorLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            errorLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])

    }
}
extension LoginViewController {
    @objc func signInButtonTapped(sender: UIButton){
        login()
    }
    func login(){
        errorLabel.isHidden = true
        guard let userName = userName, let password = password else {
            print("this should never happen")
            return
        }
        if(userName.isEmpty||password.isEmpty){
            errorHandler(message: "No username or password Provided")
            return
        }
        if userName == "Jeremy" && password == "password"{
            signInButton.configuration?.showsActivityIndicator = true
            //print("Successful Login")
            delegate?.didLogin()
        } else {
            errorHandler(message: "Incorrect username or password")
        }

    
    }
    func errorHandler(message: String){
         errorLabel.isHidden = false
         errorLabel.text = message
     }

    
}



