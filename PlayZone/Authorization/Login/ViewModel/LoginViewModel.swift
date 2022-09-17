//
//  LoginViewModel.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

protocol LoginViewModelProtocol: LoadingViewProtocol {
    func didFinishFetch()
}

class LoginViewModel {
    weak var delegate: LoginViewModelProtocol?
    private let config = GIDConfiguration(clientID: "195630356222-mrf17flsu212usgnc8i4ngcdimfqgrqe.apps.googleusercontent.com")
    var email = ""
    var password = ""
    
    func signInUser(){
        delegate?.showLoadingView()
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.hideLoadingView()
                self.delegate?.showAlertClosure(error: error.localizedDescription)
            } else {
                self.delegate?.hideLoadingView()
                self.delegate?.didFinishFetch()
            }
        }
    }
    
    func googleSignIn(presenting: UIViewController, completion: @escaping (()) -> ()){
        GIDSignIn.sharedInstance.signIn(with: config, presenting: presenting) { user, error in
            guard error == nil else { return }
            UserDefaults.standard.setLoggedIn()
            completion(())
         }
    }
    
}
