//
//  StartBuilder.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class StartBuilder {
    static func start() -> UIViewController {
        if UserDefaults.standard.getOnboarded() {
            if UserDefaults.standard.getLoggedIn() {
                return LoginViewController()
            } else {
                return LoginViewController()
            }
        } else {
            return OnboardingViewController()
        }
    }
}
