//
//  OnboardingCollectionViewCell.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

class OnboardingCollectionViewCell: BaseCollectionCell, ReusableView {
    
    let contentImage = DefaultImageView(frame: .zero)
    let titleImage = DefaultImageView(imageName: "PlayZone")
    let title = Label(txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skBold, size: 20), txtLines: 0, txtAlignment: .center)
    let nextButton = PlayZoneButton(title: "Next")
    func setup() {
        addSubviews(contentImage, titleImage, title, nextButton)
    }
    
    func setupConstraints() {
        titleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        contentImage.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(65)
            make.left.equalToSuperview().offset(61)
            make.right.equalToSuperview().offset(-61)
            make.centerX.equalToSuperview()
            make.height.equalTo(335)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(contentImage.snp.bottom).offset(70)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(64)
        }
        
    }
    
    func configure(with model: OnboardingModel){
        contentImage.imageURL(title: model.welcomeImage)
        title.text = model.titleName
        nextButton.setTitle(model.buttonName, for: .normal)
    }
    
}
