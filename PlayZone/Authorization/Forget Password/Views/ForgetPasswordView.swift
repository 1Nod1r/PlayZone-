//
//  ForgetPasswordView.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class ForgetPasswordView: BaseView {
    
    let title = Label(title: "Forgot Password", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skBold, size: 24), txtLines: 1, txtAlignment: .center)
    let subtitle = Label(title: "Enter email address associated with your account and we’ll send an email with instructions to reset your password", txtColor: AppColors.subtitleColor, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 14), txtLines: 0, txtAlignment: .center)
    let emailTxtField = PlayZoneTextField(txtFieldType: .email)
    let sendLinkButton = PlayZoneButton(title: "Send Link")
    
    
    func setup() {
        addSubviews(title, subtitle, emailTxtField, sendLinkButton)
    }
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        
        emailTxtField.snp.makeConstraints { make in
            make.top.equalTo(subtitle.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        sendLinkButton.snp.makeConstraints { make in
            make.top.equalTo(emailTxtField.snp.bottom).offset(106)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
    }
    
}
