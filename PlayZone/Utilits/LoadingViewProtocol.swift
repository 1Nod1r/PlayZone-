//
//  LoadingProtocol.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit
import ProgressHUD

protocol LoadingViewProtocol {
    func showLoadingView()
    func hideLoadingView()
}

extension LoadingViewProtocol where Self: UIViewController {
    
    func showLoadingView(){
        ProgressHUD.show("Loading")
    }
    
    func hideLoadingView(){
        ProgressHUD.dismiss()
    }
}
