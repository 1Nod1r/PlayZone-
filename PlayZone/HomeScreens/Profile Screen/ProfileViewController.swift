//
//  ProfileViewController.swift
//  PlayZone
//
//  Created by Nodirbek Khudoyberdiev on 18/09/22.
//

import UIKit
import RSKImageCropper
import PhotosUI

class ProfileViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = ProfileView
    var coordinator: HomeCoordinator?
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get()
        setupTargets()
    }
    
    override func loadView() {
        super.loadView()
        view = ProfileView()
    }
    
    private func get(){
        viewModel.getUserInfo {[weak self] model in
            guard let self = self else { return }
            self.mainView().emailTxtField.textField.text = model.email
            self.mainView().nameTxtField.textField.text = model.name
            self.mainView().profilePicture.image = model.userPhoto ?? UIImage(systemName: "person.crop.circle.fill")
        }
    }
    
    private func setupTargets(){
        mainView().profilePicture.addTapGesture(tapNumber: 1, target: self, action: #selector(openGallery))
        mainView().settingsButton.addTapGesture(tapNumber: 1, target: self, action: #selector(openSettings))
    }
    
    @objc func openGallery(){
        presentPhotoActionSheet()
    }
    
    @objc func openSettings(){
        coordinator?.openSettings()
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        if let image = info[.originalImage] as? UIImage {
            let cropVC = RSKImageCropViewController(image: image)
            cropVC.delegate = self
            cropVC.modalPresentationStyle = .overFullScreen
            self.present(cropVC, animated: true)
        }
    }
    
    private func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    private func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    private func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Галерея",
                                            message: "Как бы вы хотели выбрать картинку?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Отмена",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Сфотографировать",
                                            style: .default,
                                            handler: { [weak self] _ in
            
            self?.presentCamera()
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Выбрать фото",
                                            style: .default,
                                            handler: { [weak self] _ in
            
            self?.presentPhotoPicker()
            
        }))
        
        present(actionSheet, animated: true)
    }
}

extension ProfileViewController: RSKImageCropViewControllerDelegate {
    
    func imageCropViewControllerDidCancelCrop(_ controller: RSKImageCropViewController) {
        controller.dismiss(animated: true)
    }
    
    func imageCropViewController(_ controller: RSKImageCropViewController, didCropImage croppedImage: UIImage, usingCropRect cropRect: CGRect, rotationAngle: CGFloat) {
        mainView().profilePicture.image = croppedImage
        if let _ = croppedImage.pngData() {
            //
        }
        controller.dismiss(animated: true)
    }
    
}
