//
//  CreateAccountView.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class CreateAccountView: BaseView {
    let backButton = CustomNavigationButton(imageName: NavImageConstants.arrowLeft)
    let title = Label(title: "Create an Account", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skBold, size: 24), txtLines: 1, txtAlignment: .center)
    let nameTxtField = PlayZoneTextField(txtFieldType: .name)
    let emailTxtField = PlayZoneTextField(txtFieldType: .email)
    let passwordTxtField = PlayZoneTextField(txtFieldType: .password)
    let createButton = PlayZoneButton(title: "Create Account")
    
    func setup() {
        //
        createButton.isEnabled = false
        addSubviews(title, nameTxtField, emailTxtField, passwordTxtField, createButton)
    }
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        nameTxtField.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        emailTxtField.snp.makeConstraints { make in
            make.top.equalTo(nameTxtField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        passwordTxtField.snp.makeConstraints { make in
            make.top.equalTo(emailTxtField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        createButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTxtField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
    }
    
}
