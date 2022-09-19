//
//  CreateAccountViewModel.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import Foundation
import FirebaseAuth

protocol CreateAccountViewModelProtocol: LoadingViewProtocol{
    func didFinishFetch()
}

class CreateAccountViewModel {
    weak var delegate: CreateAccountViewModelProtocol?
    var name = ""
    var email = ""
    var password = ""
    
    func createUser(){
        delegate?.showLoadingView()
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.hideLoadingView()
                self.delegate?.showAlertClosure(error: error.localizedDescription)
            } else {
                self.postUserName(name: self.name)
                UserDefaults.standard.setLoggedIn()
                self.delegate?.hideLoadingView()
                self.delegate?.didFinishFetch()
            }
        }
    }
    
    private func postUserName(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {[weak self] error in
            self?.delegate?.showAlertClosure(error: error?.localizedDescription ?? "")
        })
    }
}
