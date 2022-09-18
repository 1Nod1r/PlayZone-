//
//  LoginViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

class LoginViewController: UIViewController, MainViewProtocol  {
    
    typealias RootView = LoginView
    let viewModel = LoginViewModel()
    private(set) lazy var coordinator: AuthorizationCoordinator? = {
        guard let navigationController = navigationController else { return  nil }

        let coordinator = AuthorizationCoordinator(navigationController: navigationController)

        return coordinator
    }()
    
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
        mainView().passwordTxtField.textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        mainView().emailTxtField.textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        mainView().loginButton.addTarget(self, action: #selector(openLogin), for: .touchUpInside)
        mainView().forgotPasswordButton.addTarget(self, action: #selector(openForgotPassword), for: .touchUpInside)
        mainView().passwordTxtField.delegate = self
        mainView().emailTxtField.delegate = self
        viewModel.delegate = self
    }
    
}

extension LoginViewController: LoginViewModelProtocol {
    func showAlertClosure(error: String) {
        showAlert(title: error)
    }
    
    func didFinishFetch() {
        coordinator?.showChooseCategories()
    }
}

extension LoginViewController {
    
    @objc func editingChanged(_ textField: UITextField){
        if mainView().emailTxtField.textField.text != "" && mainView().passwordTxtField.textField.text != ""{
            viewModel.email = mainView().emailTxtField.textField.text!
            viewModel.password = mainView().passwordTxtField.textField.text!
            mainView().loginButton.isEnabled = true
        } else {
            mainView().loginButton.isEnabled = false
        }
    }
    
    @objc func openForgotPassword(){
        coordinator?.showForgetPassword()
    }
    
    @objc func openLogin(){
        viewModel.signInUser()
    }
    
    @objc func openGoogleVerification(){
        viewModel.googleSignIn(presenting: self) {[weak self] in
            self?.coordinator?.showChooseCategories()
        }
    }
    
    @objc func openCreateAccount(){
        coordinator?.showCreateAccount()
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
