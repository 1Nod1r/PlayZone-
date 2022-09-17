//
//  GoogleButton.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class GoogleButton: BaseView {
     
    let googleImage = DefaultImageView(imageName: "googleIcon")
    let title = Label(title: "Sign in with Google", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 16), txtLines: 1)
    
    func setup() {
        borderColor = AppColors.placeHolderColor
        cornerRadius = 10
        borderWidth = 1
        addSubviews(googleImage, title)
    }
    
    func setupConstraints() {
        googleImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(74)
            make.height.width.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(googleImage.snp.right).offset(15)
            make.centerY.equalToSuperview()
            make.height.equalTo(19)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setColor(AppColors.placeHolderColor.withAlphaComponent(0.5))
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setColor(AppColors.backgroundColor)
    }

    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        setColor(AppColors.backgroundColor)
    }

    private func setColor(_ color: UIColor){
        UIView.animate(withDuration: 0.1) {
            self.backgroundColor = color
        }
    }
    
    
}
