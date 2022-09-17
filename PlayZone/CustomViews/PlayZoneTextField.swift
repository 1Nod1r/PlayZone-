//
//  PlayZoneTextField.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

protocol PlayZoneTextFieldDelegate: AnyObject {
    func textFieldDidBeginEditing(_ textField: UITextField)
    func textFieldDidEndEditing(_ textField: UITextField)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    func textFieldTextDidChange(_ textField: UITextField)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}

class PlayZoneTextField: BaseView {
    
    weak var delegate: PlayZoneTextFieldDelegate?
    var isSecure = true
    let rightButton = UIButton(imageName: "EyeClosed", systemImage: false)
    let textField: UITextField = {
        let textField = UITextField()
        textField.returnKeyType = .go
        textField.autocorrectionType = .no
        textField.font = UIFont(name: SKModernistFonts.skRegular, size: 16)
        textField.textAlignment = .left
        textField.textColor = .white
        return textField
    }()
    
    
    func setup() {
        cornerRadius = 10
        backgroundColor = AppColors.inActiveColor
        rightButton.isHidden = true
        rightButton.addTarget(self, action: #selector(changeButtonState), for: .touchUpInside)
        textField.delegate = self
        addSubviews(rightButton, textField)
    }
    
    func setupConstraints() {
        
        textField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-45)
        }
        
        rightButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-19)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
        }
        
    }
    
    convenience init(txtFieldType: String.Regex) {
        self.init(frame: .zero)
        setupTxtField(txtFieldType: txtFieldType)
    }
    
    private func setupTxtField(txtFieldType: String.Regex){
        switch txtFieldType {
        case .email:
            setPlaceHolder(placeHolder: "Email Address")
        case .password:
            rightButton.isHidden = false
            setPlaceHolder(placeHolder: "Password")
        case .name:
            setPlaceHolder(placeHolder: "Name")
        }
    }
    
    private func setPlaceHolder(placeHolder: String){
        textField.attributedPlaceholder = NSAttributedString(
            string: placeHolder,
            attributes: [NSAttributedString.Key.foregroundColor: AppColors.placeHolderColor]
        )
    }
    
    private func isEditingUI(_ isEditing: Bool) {
        if isEditing {
            backgroundColor = AppColors.activeColor
            layer.borderWidth = 1.3
            layer.borderColor = AppColors.yellowColor.cgColor
        } else {
            backgroundColor = AppColors.inActiveColor
            layer.borderWidth = 0
            layer.borderColor = AppColors.inActiveColor.cgColor
        }
    }
}

extension PlayZoneTextField {
    @objc func changeButtonState(){
        textField.isSecureTextEntry = isSecure
        let image = isSecure ? UIImage(systemName: "eye.fill") : UIImage(named: "EyeClosed")
        rightButton.setImage(image!, for: .normal)
        isSecure.toggle()
    }
}

extension PlayZoneTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        isEditingUI(true)
        delegate?.textFieldDidBeginEditing(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        isEditingUI(false)
        delegate?.textFieldDidEndEditing(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn(textField) ?? true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let delegate = delegate else { return true }
        return delegate.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
}
