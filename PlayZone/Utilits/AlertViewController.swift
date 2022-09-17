//
//  AlertViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 17/09/22.
//

import UIKit

extension UIViewController {
    func addErrorAlertView(message: String, action: (() -> Void)? = nil) {
        let title = "Error"
        showAlert(title: title, message: message, buttonAction: action)
    }

    func showAlert(title: String, message: String? = nil, buttonAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_) in
            buttonAction?()
        }))

        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }

    func showAlertWithTwoButtons(
        title: String,
        message: String = "",
        firstButtonText: String,
        firstButtonAction: (() -> Void)? = nil,
        secondButtonText: String,
        secondButtonAction: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: firstButtonText, style: UIAlertAction.Style.default, handler: { (_) in
            firstButtonAction?()
        }))

        alert.addAction(UIAlertAction(title: secondButtonText, style: UIAlertAction.Style.default, handler: { (_) in
            secondButtonAction?()
        }))

        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
