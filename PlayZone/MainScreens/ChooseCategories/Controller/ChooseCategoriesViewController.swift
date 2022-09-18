//
//  ChooseCategoriesViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class ChooseCategoriesViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = ChooseCategoriesView
    private lazy var coordinator: MainCoordinator? = {
        guard let navigationController = navigationController else { return nil }
        let coordinator = MainCoordinator(navigationController: navigationController)
        return coordinator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
    }

    override func loadView() {
        super.loadView()
        view = ChooseCategoriesView()
    }
        
    private func setupTargets(){
        mainView().nextButton.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
    }
    
    @objc func openProfile(){
        coordinator?.start()
    }
    
}
