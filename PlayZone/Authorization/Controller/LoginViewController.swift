//
//  LoginViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

class LoginViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = LoginView
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        super.loadView()
        view = LoginView()
    }
    
}
