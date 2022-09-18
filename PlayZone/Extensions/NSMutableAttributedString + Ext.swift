//
//  UILabel + Ext.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = mutableString.range(of: textForAttribute, options: .caseInsensitive)
        addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }

}
