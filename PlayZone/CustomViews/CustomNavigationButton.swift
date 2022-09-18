//
//  CustomNavigationButton.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 18/09/22.
//

import UIKit

class CustomNavigationButton: BaseView {
    
    let image = DefaultImageView(imageName: "")
    init(imageName: String){
        super.init(frame: .zero)
        setupImage(imageName: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        cornerRadius = 28
        backgroundColor = AppColors.inActiveColor
        addSubview(image)
    }
    
    func setupConstraints() {
        image.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setColor(AppColors.inActiveColor.withAlphaComponent(0.5))
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setColor(AppColors.inActiveColor)
    }

    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        setColor(AppColors.inActiveColor)
    }
    
    private func setColor(_ color: UIColor){
        UIView.animate(withDuration: 0.1) {
            self.backgroundColor = color
        }
    }
    
    private func setupImage(imageName: String){
        image.image = UIImage(named: imageName)
    }
    
    
}
