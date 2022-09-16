//
//  PlayZoneTextField.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 16/09/22.
//

import UIKit

protocol PlayZoneTextFieldDelegate: AnyObject {
    func textFieldDidBeginEditing(_ textField: PlayZoneTextField)
    func textFieldDidEndEditing(_ textField: PlayZoneTextField)
    func textFieldShouldReturn(_ textField: PlayZoneTextField) -> Bool
    func textFieldTextDidChange(_ textField: PlayZoneTextField)
    func textField(_ textField: PlayZoneTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}

class PlayZoneTextField: BaseView {
    
    weak var delegate: PlayZoneTextFieldDelegate?
    var isShowing = true
    let rightButton = UIButton(imageName: "eye.slash.fill", systemImage: true)
    let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: SKModernistFonts.skModernistRegular, size: 16)
        textField.textAlignment = .left
        textField.textColor = .white
        return textField
    }()
    
    
    func setup() {
        layer.cornerRadius = 10
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
            make.right.equalToSuperview().offset(-40)
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
            setPlaceHolder(placeHolder: "Name")
        case .password:
            rightButton.isHidden = false
            setPlaceHolder(placeHolder: "Email Address")
        case .name:
            setPlaceHolder(placeHolder: "Password")
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
        isShowing.toggle()
        textField.isSecureTextEntry = isShowing ? false : true
        let image = isShowing ? UIImage(systemName: "eye.fill") : UIImage(systemName: "eye.slash.fill")
        rightButton.setImage(image!, for: .normal)
    }
}

extension PlayZoneTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        isEditingUI(true)
        delegate?.textFieldDidBeginEditing(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        isEditingUI(false)
        delegate?.textFieldDidEndEditing(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn(self) ?? true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let delegate = delegate else { return true }
        return delegate.textField(self, shouldChangeCharactersIn: range, replacementString: string)
    }
}
