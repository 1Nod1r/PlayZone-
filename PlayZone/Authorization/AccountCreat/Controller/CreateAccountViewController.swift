//
//  CreateAccountViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class CreateAccountViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = CreateAccountView
    let viewModel = CreateAccountViewModel()
    var coordinator: AuthorizationCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
    }
    
    override func loadView() {
        super.loadView()
        view = CreateAccountView()
    }
    
    
    private func setupTargets() {
        mainView().emailTxtField.delegate = self
        mainView().passwordTxtField.delegate = self
        mainView().nameTxtField.delegate = self
        mainView().nameTxtField.textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        mainView().emailTxtField.textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        mainView().passwordTxtField.textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        mainView().backButton.addTapGesture(tapNumber: 1, target: self, action: #selector(goBack))
        mainView().createButton.addTarget(self, action: #selector(createUser), for: .touchUpInside)
        viewModel.delegate = self
    }
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func createUser(){
        viewModel.createUser()
    }
    
    @objc func editingChanged(_ textField: UITextField){
        if mainView().nameTxtField.textField.text != "" && mainView().emailTxtField.textField.text != "" && mainView().passwordTxtField.textField.text != "" {
            viewModel.name = mainView().nameTxtField.textField.text!
            viewModel.email = mainView().emailTxtField.textField.text!
            viewModel.password = mainView().passwordTxtField.textField.text!
            mainView().createButton.isEnabled = true
        } else {
            mainView().createButton.isEnabled = false
        }
    }
}

extension CreateAccountViewController: CreateAccountViewModelProtocol {
    
    func showAlertClosure(error: String) {
        showAlert(title: error)
    }
    
    func didFinishFetch() {
        coordinator?.showChooseCategories()
    }
}

extension CreateAccountViewController: PlayZoneTextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case mainView().nameTxtField.textField:
            mainView().emailTxtField.textField.becomeFirstResponder()
        case mainView().emailTxtField.textField:
            mainView().passwordTxtField.textField.becomeFirstResponder()
        case mainView().passwordTxtField.textField:
            mainView().passwordTxtField.textField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldTextDidChange(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
}
