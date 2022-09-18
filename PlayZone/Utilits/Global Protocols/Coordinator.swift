//
//  Coordinator.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 18/09/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
