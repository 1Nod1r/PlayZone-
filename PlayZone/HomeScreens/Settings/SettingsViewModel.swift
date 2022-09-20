//
//  SettingsViewModel.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 19/09/22.
//

import Foundation

class SettingsViewModel {
    let model: [SettingsModel] = [
        .init(imageName: "Notification", title: "Notifications"),
        .init(imageName: "Add User", title: "Close Friends"),
        .init(imageName: "Volume Down", title: "Sounds"),
        .init(imageName: "Lock", title: "Privacy"),
        .init(imageName: "Like", title: "Health"),
    ]
    
    func getModel() -> Int {
        return model.count
    }
}
