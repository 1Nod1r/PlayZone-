//
//  LoginView.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class LoginView: BaseView {
    
    let exampleTextField = PlayZoneTextField(txtFieldType: .password)
    let exampleTextField1 = PlayZoneTextField(txtFieldType: .name)
    
    func setup() {
        addSubviews(exampleTextField, exampleTextField1)
    }
    
    func setupConstraints() {
        exampleTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(64)
        }
        exampleTextField1.snp.makeConstraints { make in
            make.top.equalTo(exampleTextField.snp.bottom)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(64)
        }
    }
    
}
