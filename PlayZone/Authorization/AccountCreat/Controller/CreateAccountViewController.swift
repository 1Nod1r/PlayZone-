//
//  CreateAccountViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class CreateAccountViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = CreateAccountView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        super.loadView()
        view = CreateAccountView()
    }
    
}
