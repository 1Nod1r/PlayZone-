//
//  Label.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

class Label: UILabel {

    init(title: String? = nil, txtColor: UIColor, txtFont: UIFont?, txtLines: Int, txtAlignment: NSTextAlignment? = nil){
        super.init(frame: .zero)
        setupLabel(title: title, txtColor: txtColor, txtFont: txtFont, txtLines: txtLines, txtAlignment: txtAlignment)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupLabel(title: String? = nil, txtColor: UIColor, txtFont: UIFont?, txtLines: Int, txtAlignment: NSTextAlignment? = nil){
        text = title ?? ""
        textColor = txtColor
        font = txtFont ?? .systemFont(ofSize: 20, weight: .heavy)
        numberOfLines = txtLines
        textAlignment = txtAlignment ?? .left
    }

}
