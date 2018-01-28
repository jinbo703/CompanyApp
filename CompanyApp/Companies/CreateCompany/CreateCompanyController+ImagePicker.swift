//
//  CreateCompanyController+ImagePicker.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

extension CreateCompanyController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func handleSelectPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            mainView.companyImageView.image = editedImage
        } else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            mainView.companyImageView.image = originalImage
        }
        mainView.companyImageView.layer.cornerRadius = mainView.companyImageView.frame.width / 2
        mainView.companyImageView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
    
}
