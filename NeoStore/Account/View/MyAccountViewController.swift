//
//  MyAccountViewController.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import UIKit

class MyAccountViewController: NavigationViewController {

    @IBOutlet weak var firstNameView: BorderedField!
    @IBOutlet weak var lastNameView: BorderedField!
    @IBOutlet weak var emailView: BorderedField!
    @IBOutlet weak var phoneView: BorderedField!
    @IBOutlet weak var dobView: BorderedField!
    
    
    @IBOutlet weak var editProfileBtn: UIButton!
    @IBOutlet weak var resetPasswordBtn: UIButton!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!

//    var editProfileData:EditProfileDataModel?
    
    let navigationDrawerViewModel = NavigationDrawerViewModel()
    
    let navigationBarUtility = NavigationBarUtility()
    
   var editProfileData : ((EditProfileDataModel) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProfilePicture()
        fetchAccountDetails()
        setUpNavBar()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchAccountDetails()
    }
    @IBAction func editProfileClick(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: Constant.accountStoryBoard, bundle: nil)
        let editProfileViewController = storyBoard.instantiateViewController(withIdentifier: Constant.editProfileViewController) as! EditProfileViewController
        
        let editData = navigationDrawerViewModel.getEditProfileData()
        editProfileViewController.editProfileViewModel.setEditData(editData: editData)
        self.navigationController?.pushViewController(editProfileViewController, animated: true)

    }
    
    @IBAction func resetPassword(_ sender: Any) {
        
        self.navigate(storyBoard: Constant.accountStoryBoard, identifier: Constant.resetPasswordViewController, vc: self)
    }
}

extension MyAccountViewController{
    func setUpProfilePicture(){
        let profileLayer = profileImage.layer
        profileLayer.borderWidth = 1
        profileLayer.masksToBounds = false
        profileLayer.cornerRadius = 100
        profileImage.clipsToBounds = true
    }
    
    func fetchAccountDetails(){
        navigationDrawerViewModel.fetchNavigationDrawerData {
        
            self.profileImage.loadImage(imgString:self.navigationDrawerViewModel.getProfilePic())
            self.firstNameTextField.text = self.navigationDrawerViewModel.getfirstName()
            self.lastNameTextField.text = self.navigationDrawerViewModel.getLastName()
            self.emailTextField.text = self.navigationDrawerViewModel.getEmail()
            self.phoneTextField.text = self.navigationDrawerViewModel.getPhoneNo()
            self.dateOfBirthTextField.text = self.navigationDrawerViewModel.getDob()
        }

       
        
        }

    func setUpNavBar(){
        navigationBarUtility.setTitle(Constant.myAccountTitle, self)
        navigationBarUtility.configureRightBarButton(image:Images.searchIcon,style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }

}
