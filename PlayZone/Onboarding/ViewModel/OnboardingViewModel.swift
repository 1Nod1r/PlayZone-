//
//  OnboardingViewModel.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import Foundation

class OnboardingViewModel {
    
    let model: [OnboardingModel] = [
        .init(buttonName: "Next", titleName: "Latest Feature in Streaming Your Favorite Channel", welcomeImage: "onb-1"),
        .init(buttonName: "Next", titleName: "Feel The Beat as You are involved in the game", welcomeImage: "onb-2"),
        .init(buttonName: "Start Experience", titleName: "Share Your Awesome Experience with family & Friends", welcomeImage: "onb-3")
    ]
    
    func getModel() -> Int {
        return model.count
    }
}
