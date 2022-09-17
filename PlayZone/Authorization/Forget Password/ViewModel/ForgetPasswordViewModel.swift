//
//  ForgetPasswordViewModel.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import Foundation
import FirebaseAuth

protocol ForgetPasswordViewModelProtocol: LoadingViewProtocol {
    func didFinishFetch()
}

class ForgetPasswordViewModel {
    weak var delegate: ForgetPasswordViewModelProtocol?
    var email = ""
    
    func forgetPassword(){
        delegate?.showLoadingView()
        Auth.auth().sendPasswordReset(withEmail: email) {[weak self] error in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.hideLoadingView()
                self.delegate?.showAlertClosure(error: error.localizedDescription)
            } else {
                self.delegate?.hideLoadingView()
            }
        }
    }
}
