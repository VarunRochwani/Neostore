//
//  MyAccountViewController.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import UIKit

class MyAccountViewController: UIViewController {

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
    
    var accountDetails:NavigationDrawerModel?
    var editProfileData:EditProfileDataModel?
    
    let navigationDrawerViewModel = NavigationDrawerViewModel()
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProfilePicture()
        fetchAccountDetails()
        setUpNavBar()
        setUpBorder()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchAccountDetails()
    }
    @IBAction func editProfileClick(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Account", bundle: nil)
        var editProfileViewController = storyBoard.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        editProfileViewController.editProfileData = self.editProfileData
        self.navigationController?.pushViewController(editProfileViewController, animated: true)
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Account", bundle: nil)
        let resetPasswordViewController = storyBoard.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        self.navigationController?.pushViewController(resetPasswordViewController, animated: true)
        
    }
    
    
}


extension MyAccountViewController{
    func setUpProfilePicture(){
        let profileLayer = profileImage.layer
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = 100
        profileImage.clipsToBounds = true
    }
    
    func fetchAccountDetails(){
        navigationDrawerViewModel.fetchNavigationDrawerData {
            result in
            if result.status == 200{
                self.accountDetails = result
                self.loadImage(result.data.userData.profilePic ?? "")
                self.firstNameTextField.text = self.accountDetails?.data.userData.firstName
                self.lastNameTextField.text = self.accountDetails?.data.userData.lastName
                self.emailTextField.text = self.accountDetails?.data.userData.email
                self.phoneTextField.text = self.accountDetails?.data.userData.phoneNo
                self.dateOfBirthTextField.text = self.accountDetails?.data.userData.dob
                
                self.editProfileData = EditProfileDataModel(firstName: self.accountDetails?.data.userData.firstName ?? "" , lastName: self.accountDetails?.data.userData.lastName ?? "", email: self.accountDetails?.data.userData.email ?? "", dob: self.accountDetails?.data.userData.dob ?? "", profilePic: result.data.userData.profilePic ?? "", phoneNo: self.accountDetails?.data.userData.phoneNo ?? "")
                
            }else{
                AlertUtility.showAlert("details not found", "Something went Wrong", self)
            }
        }
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
    func setUpNavBar(){
        navigationBarUtility.setTitle("My Account", self)
        navigationBarUtility.configureRightBarButton(image:"search_icon",style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: "chevron.left", style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUpBorder(){
        firstNameView.setupUI()
        lastNameView.setupUI()
        emailView.setupUI()
        phoneView.setupUI()
        dobView.setupUI()
    }
}
