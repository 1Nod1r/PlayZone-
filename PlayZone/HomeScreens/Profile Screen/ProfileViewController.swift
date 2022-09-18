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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
    }
    
    override func loadView() {
        super.loadView()
        view = ProfileView()
    }

}
