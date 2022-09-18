//
//  ForgetPasswordViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class ForgetPasswordViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = ForgetPasswordView
    let viewModel = ForgetPasswordViewModel()
    var coordinator: AuthorizationCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
        //
    }

    override func loadView() {
        super.loadView()
        view = ForgetPasswordView()
    }
    
    private func setupTargets(){
        mainView().sendLinkButton.addTarget(self, action: #selector(sendLink), for: .touchUpInside)
        mainView().emailTxtField.textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        mainView().backButton.addTapGesture(tapNumber: 1, target: self, action: #selector(backButton))
        mainView().emailTxtField.delegate = self
        viewModel.delegate = self
    }
    
    @objc func editingChanged(_ textField: UITextField){
        if textField.text != "" {
            viewModel.email = textField.text!
            mainView().sendLinkButton.isEnabled = true
        } else {
            mainView().sendLinkButton.isEnabled = false
        }
    }
    
    @objc func backButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func sendLink(){
        viewModel.forgetPassword()
    }
    
}

extension ForgetPasswordViewController: ForgetPasswordViewModelProtocol {
    func showAlertClosure(error: String) {
        showAlert(title: error)
    }
    
    func didFinishFetch() {
        coordinator?.showChooseCategories()
    }
}

extension ForgetPasswordViewController: PlayZoneTextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldTextDidChange(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
}
