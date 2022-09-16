//
//  UIViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

extension UIViewController {
    func closeKeyboardOnOutsideTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard)
        )

        tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }

    @objc public func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
