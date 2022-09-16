//
//  UIView + Ext.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach { addSubview($0) }
    }
    
    convenience init(color: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = color
    }
}


