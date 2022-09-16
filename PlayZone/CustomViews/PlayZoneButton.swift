//
//  PlayZoneButton.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

class PlayZoneButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        makeButton(with: title)
    }
        
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func makeButton(with title: String){
        setTitle(title, for: .normal)
        layer.cornerRadius = 12
        setTitleColor(AppColors.backgroundColor, for: .normal)
        titleLabel?.font = UIFont(name: SKModernistFonts.skModernistBold, size: 20)
        tintColor = AppColors.backgroundColor
        setTitleColor(AppColors.backgroundColor, for: .normal)
        setTitleColor(AppColors.backgroundColor, for: .highlighted)
        setTitleColor(AppColors.backgroundColor, for: .disabled)
        setBackgroundColor(color: AppColors.yellowColor, forState: .normal)
        setBackgroundColor(color: AppColors.yellowColor.withAlphaComponent(0.6), forState: .highlighted)
        setBackgroundColor(color: AppColors.yellowColor.withAlphaComponent(0.6), forState: .disabled)
    }
    
    
}
