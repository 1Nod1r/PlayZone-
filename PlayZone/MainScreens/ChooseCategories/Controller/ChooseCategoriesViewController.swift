//
//  ChooseCategoriesViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class ChooseCategoriesViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = ChooseCategoriesView
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        super.loadView()
        view = ChooseCategoriesView()
    }
    
}
