//
//  EditProfileViewController.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet var firstNameView: BorderedField!
    
    @IBOutlet var lastNameView: BorderedField!
    
    
    @IBOutlet var emailView: BorderedField!

    @IBOutlet var phoneView: BorderedField!
    
    @IBOutlet var dobView: BorderedField!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    
    @IBOutlet weak var editProfilePicBtn: UIButton!
    var imagePicker:UIImagePickerController!
    @IBOutlet weak var submitBtn: UIButton!
    
    let navigationBarUtility = NavigationBarUtility()

    let editProfileViewModel = EditProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEditProfileData()
        setUpProfileImage()
        setUpNavBar()
        setUpImagePicker()
        
    }
  
    @objc func openImagePicker(_ sender:Any) {
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    
   
    @IBAction func submitBtnAction(_ sender: Any) {

        let editedData = EditProfileDataModel(firstName: firstNameTextField.text ?? "" , lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", dob: dobTextField.text ?? "", profilePic:Constant.urlString+(profileImage.image?.base64 ?? "") , phoneNo: phoneTextField.text ?? "")
        
        editProfileViewModel.editProfile(editedData) { result in
            print(result.message!)
        }

    }

    func setUpNavBar(){
        navigationBarUtility.setTitle(Constant.editProfileTitle, self)
        navigationBarUtility.configureRightBarButton(image:Images.searchIcon,style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupEditProfileData(){
        guard let editProfileData = editProfileViewModel.getEditData() else { return }
        self.firstNameTextField.text = editProfileData.firstName
        self.lastNameTextField.text = editProfileData.lastName
        self.emailTextField.text = editProfileData.email
        self.phoneTextField.text = editProfileData.phoneNo
        self.dobTextField.text = editProfileData.dob
        profileImage.loadImage(imgString: editProfileData.profilePic)
    }
}
extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}
