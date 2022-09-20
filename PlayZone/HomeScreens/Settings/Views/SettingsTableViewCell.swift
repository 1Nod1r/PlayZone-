//
//  SettingsTableViewCell.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 19/09/22.
//

import UIKit

class SettingsTableViewCell: BaseTableCell, ReusableView {
    
    let image = DefaultImageView(imageName: "")
    let title = Label(title: nil, txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 16), txtLines: 1, txtAlignment: nil)
    let rightButton = UIButton(imageName: "chevron.right", systemImage: true)
    let switchButton = UISwitch()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(switchButton)
    }
    
    func setup() {
        cornerRadius = 10
        switchButton.onTintColor = AppColors.yellowColor
        switchButton.isHidden = true
        addSubviews(image, title, rightButton, switchButton )
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
    
    func setupConstraints() {
        image.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.height.width.equalTo(24)
            make.centerY.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }
        
        rightButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-24)
            make.height.width.equalTo(24)
            make.centerY.equalToSuperview()
        }
        
        switchButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(24)
            make.width.equalTo(44)
            make.centerY.equalToSuperview()
        }
        
    }
    
    func configure(with model: SettingsModel){
        image.imageURL(title: model.imageName)
        title.text = model.title
    }
    
}
