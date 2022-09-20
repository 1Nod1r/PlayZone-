//
//  ProfileViewModel.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 19/09/22.
//

import Foundation
import FirebaseAuth
import SDWebImage

protocol ProfileViewModelProtocol {
    func getUserInfo(completion: @escaping (ProfileModel) -> ())
}

class ProfileViewModel: ProfileViewModelProtocol  {
    func getUserInfo(completion: @escaping (ProfileModel) -> ()){
        if let user = Auth.auth().currentUser {
            if let url = user.photoURL {
                let data = try? Data(contentsOf: url)
                completion(ProfileModel(name: user.displayName ?? "", email: user.email ?? "", userPhoto: UIImage.sd_image(with: data)))
            } else {
                completion(ProfileModel(name: user.displayName ?? "", email: user.email ?? "", userPhoto: nil))
            }
        }
    }
}
