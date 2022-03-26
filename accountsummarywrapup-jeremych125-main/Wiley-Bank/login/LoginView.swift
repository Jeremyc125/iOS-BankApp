//
//  LoginView.swift
//  Wiley-Bank
//
//  Created by user216422 on 3/21/22.
//

import UIKit

class LoginView: UIView{
    
    let stackView = UIStackView()
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    override init(frame: CGRect){
        super.init(frame:frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension LoginView{
    func style(){
            //prepares the View for autolayout
            translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .white
            layer.cornerRadius = 5
            clipsToBounds = true
            
            //stackview
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 0
        
            //userNameText Field
            userNameTextField.translatesAutoresizingMaskIntoConstraints = false
            userNameTextField.placeholder = "Username"
            userNameTextField.delegate = self
        
            //dividerView
            dividerView.translatesAutoresizingMaskIntoConstraints = false
            dividerView.backgroundColor = .secondarySystemFill
        
           
            //passwordTextField
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.placeholder = "Password"
            passwordTextField.isSecureTextEntry = true
            passwordTextField.delegate = self
        
        }

    
    func layout() {
            stackView.addArrangedSubview(userNameTextField)
            stackView.addArrangedSubview(dividerView)
            stackView.addArrangedSubview(passwordTextField)
           
            addSubview(stackView)
           
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
                stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
                trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
                bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
                ])
        

                //our dividerView, and we’re setting isActive to true
            dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        

       }



    
}

extension LoginView: UITextFieldDelegate {
    
    
    //the user hits return, so we should end editing and return true
    //callback to see what's in the text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        return true
    }


    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
