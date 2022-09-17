//
//  LoadingProtocol.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit
import ProgressHUD

protocol LoadingViewProtocol: AnyObject {
    func showLoadingView()
    func hideLoadingView()
    func showAlertClosure(error: String)
}

extension LoadingViewProtocol where Self: UIViewController {
    
    func showLoadingView(){
        ProgressHUD.show("Loading")
    }
    
    func hideLoadingView(){
        ProgressHUD.dismiss()
    }
}
