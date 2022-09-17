//
//  LoginView.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class LoginView: BaseView {
    
    let titleLabel = Label(title: "Login Now", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skBold, size: 24), txtLines: 1, txtAlignment: .center)
    let subtitleLabel = Label(title: "Welcome back to PlayZone! Enter your email addres and your password to enjoy the latest features of PlayZone", txtColor: AppColors.subtitleColor, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 14), txtLines: 0, txtAlignment: .center)
    let emailTxtField = PlayZoneTextField(txtFieldType: .email)
    let passwordTxtField = PlayZoneTextField(txtFieldType: .password)
    let forgotPasswordButton = UIButton.highLightedButton(title: "Forgot password", textColor: AppColors.yellowColor, size: 14)
    let loginButton = PlayZoneButton(title: "Login Now")
    let googleButton = GoogleButton()
    let createAccountLabel = Label(txtColor: AppColors.placeHolderColor, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 16), txtLines: 1, txtAlignment: .center)
    
    func setup() {
        let stringValue = "Don’t have acoount? Create one"
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
        attributedString.setColorForText(textForAttribute: "Don’t have acoount?", withColor: AppColors.placeHolderColor)
        attributedString.setColorForText(textForAttribute: "Create one", withColor: AppColors.yellowColor)
        createAccountLabel.attributedText = attributedString
        loginButton.isEnabled = false
        addSubviews(titleLabel, subtitleLabel, emailTxtField, passwordTxtField, forgotPasswordButton, loginButton, googleButton, createAccountLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(29)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        
        emailTxtField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(50)
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
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTxtField.snp.bottom).offset(30)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(14)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(40)
            make.right.equalToSuperview().offset(-24)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(56)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(18)
            make.right.equalToSuperview().offset(-24)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(56)
        }
        
        createAccountLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(64)
            make.right.equalToSuperview().offset(-64)
            make.height.equalTo(19)
        }
        
    }
    
}
