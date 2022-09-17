//
//  UIButton + Ext.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: CGPoint.zero, size: size))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setBackgroundImage(colorImage, for: forState)
    }
    
    convenience init(imageName: String, systemImage: Bool? = nil) {
        self.init(frame: .zero)
        tintColor = .white
        if let systemImage = systemImage {
            guard let image = systemImage ? UIImage(systemName: imageName) : UIImage(named: imageName) else { return }
            setImage(image, for: .normal)
        } else {
            guard let image = UIImage(named: imageName) else { return }
            setImage(image, for: .normal)
        }
        clipsToBounds = true
        layer.masksToBounds = true
    }

}

extension UIButton {
    static func highLightedButton(title: String, textColor: UIColor, size: CGFloat) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = UIFont(name: SKModernistFonts.skRegular, size: size)
        return button
    }
}
