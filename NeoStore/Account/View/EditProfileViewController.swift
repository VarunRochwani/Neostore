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
    
    var editProfileData:EditProfileDataModel? = nil
    
    let editProfileViewModel = EditProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        setUpProfileImage()
        setUpNavBar()
        setUpImagePicker()
    }
    
    @objc func openImagePicker(_ sender:Any) {
            //Open Image Picker
            self.present(imagePicker, animated: true, completion: nil)
        }
    
   
    @IBAction func submitBtnAction(_ sender: Any) {
        
        
        let editedData = EditProfileDataModel(firstName: firstNameTextField.text ?? "" , lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", dob: dobTextField.text ?? "", profilePic:"data:image/jpg;base64,"+(profileImage.image?.base64 ?? "") , phoneNo: phoneTextField.text ?? "")
        
        editProfileViewModel.editProfile(editedData) { result in
            print(result.message!)
        }

    }

    func setUpNavBar(){
        navigationBarUtility.setTitle("Edit profile", self)
        navigationBarUtility.configureRightBarButton(image:"search_icon",style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: "chevron.left", style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func initialSetUp(){
        firstNameTextField.text = editProfileData?.firstName
        lastNameTextField.text = editProfileData?.lastName
        emailTextField.text = editProfileData?.email
        phoneTextField.text = editProfileData?.phoneNo
        dobTextField.text = editProfileData?.dob
        loadImage(editProfileData?.profilePic ?? "")
        
        firstNameView.setupUI()
        lastNameView.setupUI()
        emailView.setupUI()
        phoneView.setupUI()
        dobView.setupUI()
        
    }
    
    func loadImage(_ Url:String){
        if let img = URL(string: Url) {
            URLSession.shared.dataTask(with: img) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.profileImage.image = image
                    }
                }
            }.resume()
        }
    }

}
extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}
