//
//  ProfileView.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 18/09/22.
//

import UIKit

class ProfileView: BaseView {
    
    let title = Label(title: "My Profile", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skBold, size: 28), txtLines: 1, txtAlignment: nil)
    let settingsButton = CustomNavigationButton(imageName: NavImageConstants.gear)
    let profilePicture = DefaultImageView(imageName: "image 26")
    let nameLabel = Label(title: "Erlink Halah", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 20), txtLines: 1, txtAlignment: .center)
    let emailLabel = Label(title: "erlinkland@gmail.com", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 12), txtLines: 1, txtAlignment: .center)
    let idLabel = Label(title: "ID: 1234567", txtColor: .white.withAlphaComponent(0.3), txtFont: UIFont(name: SKModernistFonts.skRegular, size: 11), txtLines: 1, txtAlignment: .center)
    let nameTxtField = PlayZoneTextField(txtFieldType: .name)
    let emailTxtField = PlayZoneTextField(txtFieldType: .email)
    let passwordTxtField = PlayZoneTextField(txtFieldType: .password)
    let saveChangesButton = PlayZoneButton(title: "Save Changes")
    let nameSubtitle = Label(title: "Full name", txtColor: .white.withAlphaComponent(0.5), txtFont: UIFont(name: SKModernistFonts.skRegular, size: 14), txtLines: 1, txtAlignment: .left)
    let emailSubtitle = Label(title: "Email address", txtColor: .white.withAlphaComponent(0.5), txtFont: UIFont(name: SKModernistFonts.skRegular, size: 14), txtLines: 1, txtAlignment: .left)
    let passwordSubtitle = Label(title: "Password", txtColor: .white.withAlphaComponent(0.5), txtFont: UIFont(name: SKModernistFonts.skRegular, size: 14), txtLines: 1, txtAlignment: .left)
    
    
    func setup() {
        profilePicture.cornerRadius = 40
        addSubviews(title, settingsButton, profilePicture, nameLabel, emailLabel, idLabel, nameTxtField, emailTxtField, passwordTxtField, saveChangesButton, nameSubtitle, emailSubtitle, passwordSubtitle)
    }
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(82)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(32)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.centerY.equalTo(title.snp.centerY)
            make.right.equalToSuperview().offset(-24)
            make.height.width.equalTo(56)
        }
        
        profilePicture.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(22)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profilePicture.snp.top)
            make.left.equalTo(profilePicture.snp.right).offset(25)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profilePicture.snp.centerY)
            make.left.equalTo(profilePicture.snp.right).offset(25)
        }
        
        idLabel.snp.makeConstraints { make in
            make.bottom.equalTo(profilePicture.snp.bottom).offset(-10)
            make.left.equalTo(profilePicture.snp.right).offset(25)
        }
        
        nameSubtitle.snp.makeConstraints { make in
            make.top.equalTo(profilePicture.snp.bottom).offset(48)
            make.left.equalToSuperview().offset(24)
        }
        
        nameTxtField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(nameSubtitle.snp.bottom).offset(16)
            make.height.equalTo(60)
            make.right.equalToSuperview().offset(-24)
        }
        
        emailSubtitle.snp.makeConstraints { make in
            make.top.equalTo(nameTxtField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
        }
        
        emailTxtField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(emailSubtitle.snp.bottom).offset(16)
            make.height.equalTo(60)
            make.right.equalToSuperview().offset(-24)
        }
        
        passwordSubtitle.snp.makeConstraints { make in
            make.top.equalTo(emailTxtField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
        }
        
        passwordTxtField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(passwordSubtitle.snp.bottom).offset(16)
            make.height.equalTo(60)
            make.right.equalToSuperview().offset(-24)
        }
        
        saveChangesButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(64)
        }
        
    }

}
