//
//  ProfileViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 18/09/22.
//

import UIKit

class ProfileViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = ProfileView
    var coordinator: HomeCoordinator?
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get()
    }
    
    override func loadView() {
        super.loadView()
        view = ProfileView()
    }
    
    private func get(){
        viewModel.getUserInfo {[weak self] model in
            guard let self = self else { return }
            self.mainView().emailTxtField.textField.text = model.email
            self.mainView().nameTxtField.textField.text = model.name
            self.mainView().passwordTxtField.textField.text = "12345678"
            self.mainView().profilePicture.image = model.userPhoto ?? UIImage(named: "image 26")
        }
    }
    
}
