//
//  AuthorizationCoordinator.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 18/09/22.
//

import UIKit

final class AuthorizationCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        UserDefaults.standard.setOnboarded()
        let vc = LoginViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .overFullScreen
        navVC.setNavigationBarHidden(true, animated: false)
        navigationController.present(navVC, animated: true)        
    }
    
    func showForgetPassword(){
        let vc = ForgetPasswordViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showCreateAccount(){
        let vc = CreateAccountViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showChooseCategories(){
        let vc = ChooseCategoriesViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .overFullScreen
        navVC.setNavigationBarHidden(true, animated: false)
        navigationController.present(navVC, animated: true)
    }
    
    
}
