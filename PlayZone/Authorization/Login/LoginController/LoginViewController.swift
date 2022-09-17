//
//  LoginViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, MainViewProtocol, LoadingViewProtocol {
    
    typealias RootView = LoginView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
    }

    override func loadView() {
        super.loadView()
        view = LoginView()
    }
    
    private func setupTargets(){
        mainView().googleButton.addTapGesture(tapNumber: 1, target: self, action: #selector(openGoogleVerification))
        mainView().createAccountLabel.addTapGesture(tapNumber: 1, target: self, action: #selector(openCreateAccount))
        mainView().loginButton.addTarget(self, action: #selector(openLogin), for: .touchUpInside)
        mainView().forgotPasswordButton.addTarget(self, action: #selector(openForgotPassword), for: .touchUpInside)
        mainView().passwordTxtField.delegate = self
        mainView().emailTxtField.delegate = self
    }
    
}

extension LoginViewController {
    
    @objc func openForgotPassword(){
        navigationController?.pushViewController(ForgetPasswordViewController(), animated: true)
    }
    
    @objc func openLogin(){
        navigationController?.pushViewController(ChooseCategoriesViewController(), animated: true)
    }
    
    @objc func openGoogleVerification(){
        let config = GIDConfiguration(clientID: "195630356222-mrf17flsu212usgnc8i4ngcdimfqgrqe.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) {[weak self] user, error in
            guard error == nil else { return }
            UserDefaults.standard.setLoggedIn()
         }
    }
    
    @objc func openCreateAccount(){
        navigationController?.pushViewController(CreateAccountViewController(), animated: true)
    }
}

extension LoginViewController: PlayZoneTextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == mainView().emailTxtField.textField {
            mainView().passwordTxtField.textField.becomeFirstResponder()
        } else {
            mainView().passwordTxtField.textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldTextDidChange(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
}
