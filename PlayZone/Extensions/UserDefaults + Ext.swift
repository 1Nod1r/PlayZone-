//
//  UserDefaults + Ext.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import Foundation

fileprivate struct UserDefaultsConstants {
    static let onboarded = "onboarded"
    static let loggedIn = "loggedIn"
}

extension UserDefaults {
    func setOnboarded(){
        set(true, forKey: UserDefaultsConstants.onboarded)
    }
    
    func getOnboarded() -> Bool {
        return bool(forKey: UserDefaultsConstants.onboarded)
    }
    
    func removeOnboarded(){
        removeObject(forKey: UserDefaultsConstants.onboarded)
    }
    
    func setLoggedIn(){
        set(true, forKey: UserDefaultsConstants.loggedIn)
    }
    
    func getLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsConstants.loggedIn)
    }
    
    func removeLoggedIn(){
        removeObject(forKey: UserDefaultsConstants.loggedIn)
    }
}
