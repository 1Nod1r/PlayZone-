//
//  UIImage + Ext.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

class DefaultImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(imageName: String, systemImage: Bool? = nil){
        self.init(frame: .zero)
        setupImage(imageName: imageName, systemImage: systemImage)
    }
    
    private func setupImage(imageName: String, systemImage: Bool? = nil){
        if let systemImage = systemImage {
            image = systemImage ? UIImage(systemName: imageName) : UIImage(named: imageName)
        } else {
            image = UIImage(named: imageName)
        }
        layer.masksToBounds = true
        clipsToBounds = true
        contentMode = .scaleAspectFit
    }
}
