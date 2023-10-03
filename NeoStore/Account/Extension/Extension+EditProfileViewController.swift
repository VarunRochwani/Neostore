//
//  Extension+EditProfileViewController.swift
//  NeoStore
//
//  Created by neosoft on 20/09/23.
//

import Foundation
import UIKit

extension EditProfileViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }

        internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                self.profileImage.image = pickedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
    
    func setUpProfileImage(){
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }
    
    func setUpImagePicker(){
        editProfilePicBtn.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
    
}
