//
//  ChooseCategoriesView.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

class ChooseCategoriesView: BaseView {
    
    let title = Label(title: "Choose Categories", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skBold, size: 24), txtLines: 1, txtAlignment: .center)
    let subtitle = Label(title: "Select your preferences game category", txtColor: AppColors.subtitleColor, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 14), txtLines: 0, txtAlignment: .center)
    let puzzleImage = CustomNavigationButton(imageName: "puzzle")
    let sportImage = CustomNavigationButton(imageName: "sport")
    let gamesImage = CustomNavigationButton(imageName: "games")
    let battleImage = CustomNavigationButton(imageName: "battle")
    let nextButton = PlayZoneButton(title: "Next")
    let puzzleTitle = Label(title: "Puzzle", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 16), txtLines: 1, txtAlignment: .center)
    let sportTitle = Label(title: "Sports", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 16), txtLines: 1, txtAlignment: .center)
    let battleTitle = Label(title: "Strategy", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 16), txtLines: 1, txtAlignment: .center)
    let gamesTitle = Label(title: "Logic", txtColor: .white, txtFont: UIFont(name: SKModernistFonts.skRegular, size: 16), txtLines: 1, txtAlignment: .center)
    
    
    func setup() {
        let buttons = [puzzleImage, sportImage, gamesImage, battleImage]
        for button in buttons {
            button.cornerRadius = 50
        }
        addSubviews(title, subtitle, puzzleImage, sportImage, gamesImage, battleImage, nextButton, puzzleTitle, sportTitle, battleTitle, gamesTitle)
    }
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(64)
            make.right.equalToSuperview().offset(-64)
        }
        
        puzzleImage.snp.makeConstraints { make in
            make.top.equalTo(subtitle.snp.bottom).offset(107)
            make.left.equalToSuperview().offset(56)
            make.width.height.equalTo(100)
        }
        
        puzzleTitle.snp.makeConstraints { make in
            make.top.equalTo(puzzleImage.snp.bottom).offset(16)
            make.centerX.equalTo(puzzleImage.snp.centerX)
        }
        
        battleImage.snp.makeConstraints { make in
            make.centerY.equalTo(puzzleImage.snp.centerY)
            make.right.equalTo(-56)
            make.width.height.equalTo(100)
        }
        
        battleTitle.snp.makeConstraints { make in
            make.top.equalTo(battleImage.snp.bottom).offset(16)
            make.centerX.equalTo(battleImage.snp.centerX)
        }
        
        sportImage.snp.makeConstraints { make in
            make.top.equalTo(puzzleImage.snp.bottom).offset(72)
            make.left.equalToSuperview().offset(56)
            make.width.height.equalTo(100)
        }
        
        sportTitle.snp.makeConstraints { make in
            make.top.equalTo(sportImage.snp.bottom).offset(16)
            make.centerX.equalTo(sportImage.snp.centerX)
        }
        
        gamesImage.snp.makeConstraints { make in
            make.centerY.equalTo(sportImage.snp.centerY)
            make.right.equalTo(-56)
            make.width.height.equalTo(100)
        }
        
        gamesTitle.snp.makeConstraints { make in
            make.top.equalTo(gamesImage.snp.bottom).offset(16)
            make.centerX.equalTo(gamesImage.snp.centerX)
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(64)
        }
        
    }
    
}
