//
//  SettingsView.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 19/09/22.
//

import UIKit

class SettingsView: BaseView {

    let backButton = CustomNavigationButton(imageName: NavImageConstants.arrowLeft)
    let title = Label(title: "Settings", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skBold, size: 16), txtLines: 1, txtAlignment: .center)
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.rowHeight = 72
        table.isScrollEnabled = false
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.defaultReuseIdentifier)
        return table
    }()
    let subtitle = Label(title: "General", txtColor: .white.withAlphaComponent(0.5), txtFont: UIFont(name: SKModernistFonts.skRegular, size: 16), txtLines: 1, txtAlignment: nil)
    
    func setup() {
        addSubviews(backButton, title, tableView, subtitle)
    }
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(title.snp.centerY)
            make.left.equalToSuperview().offset(24)
            make.height.width.equalTo(56)
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(24)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(subtitle.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
        }
        
    }
    
}
