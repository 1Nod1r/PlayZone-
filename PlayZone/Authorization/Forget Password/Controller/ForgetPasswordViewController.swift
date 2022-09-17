//
//  ForgetPasswordViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class ForgetPasswordViewController: UIViewController, MainViewProtocol, LoadingViewProtocol {
    
    typealias RootView = ForgetPasswordView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func loadView() {
        super.loadView()
        view = ForgetPasswordView()
    }
    
    
}
