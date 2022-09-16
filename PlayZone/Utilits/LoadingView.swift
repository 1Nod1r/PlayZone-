//
//  LoadingProtocol.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit
import ProgressHUD

protocol LoadingView {
    func showLoadingView()
    func hideLoadingView()
}

extension LoadingView where Self: UIViewController {
    
    func showLoadingView(){
        ProgressHUD.show("Loading")
    }
    
    func hideLoadingView(){
        ProgressHUD.dismiss()
    }
}
