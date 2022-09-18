//
//  MainViewProtocol.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    associatedtype RootView: UIView
}

extension MainViewProtocol where Self: UIViewController {
    
    func mainView() -> RootView {
        guard let view = view as? RootView else { return RootView()}
        return view
    }
}
