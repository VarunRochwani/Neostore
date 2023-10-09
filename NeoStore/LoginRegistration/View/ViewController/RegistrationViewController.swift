//
//  RegistrationViewController.swift
//  NeoStore
//
//  Created by apple on 09/08/23.
//

import UIKit

class RegistrationViewController: NavigationViewController {
    
    @IBOutlet weak var firstNameView: BorderedField!
    @IBOutlet weak var lastNameView: BorderedField!
    @IBOutlet weak var emailView: BorderedField!
    @IBOutlet weak var passwordView: BorderedField!
    @IBOutlet weak var cnfPasswordView: BorderedField!
    @IBOutlet weak var phoneNumberView: BorderedField!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    
    @IBOutlet weak var maleImage: UIImageView!
    @IBOutlet weak var femaleImage: UIImageView!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    var gender:String?
    var checkBoxFlag = true
    
    @IBOutlet weak var checkBoxImage: UIImageView!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    let registerViewModel = RegisterViewModel()
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        maleButton.tag = 1
        femaleButton.tag = 2
    }
    
    
    @IBAction func selectGender(_ sender:   UIButton) {
        if sender.tag == 1{
            maleImage.image = UIImage(named: Images.checkedCheckBox)
            femaleImage.image = UIImage(named:Images.uncheckedCheckBox)
            gender = Constant.male
        }else if  sender.tag==2{
            maleImage.image = UIImage(named: Images.uncheckedCheckBox)
            femaleImage.image = UIImage(named: Images.checkedCheckBox)
            gender = Constant.female
        }
    }
    
    
    @IBAction func onClickCheckBox(_ sender: Any) {
        if checkBoxFlag{
            checkBoxImage.image = UIImage(named: Images.uncheckedCheckBox)
            checkBoxFlag = false
        }else{
            checkBoxFlag = true
            checkBoxImage.image = UIImage(named: Images.checkedCheckBox)
        }
        
    }
    
   //MARK: NAVIGATION BAR
    func setUpNavBar(){
        self.navigationController?.navigationBar.isHidden = false
        navigationBarUtility.setTitle(Constant.registerTitle, self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func register(_ sender: Any) {
        if checkBoxFlag{
            let user = User(firstName:firstName.text,lastName:lastName.text ,email:email.text ,password:password.text ,confirmPassword:confirmPassword.text ,gender:gender ,phoneNo:Int(phoneNumber?.text ?? ""))
            
            registerViewModel.validateAndRegister(user: user){(message,statusCode) in
                
                if statusCode == 200{
                    AlertUtility.showAlert(message, "Registered Successfully", self)
                    self.navigate(storyBoard: Constant.mainStoryBoard, identifier: Constant.loginVcIdentifier, vc: self)
                    self.navigationController?.navigationBar.isHidden = true
                }
                else{
                    
                    AlertUtility.showAlert(message, "Error", self)
                }
                
            }
        }
        else {
            AlertUtility.showAlert(Constant.confirmTermsMessage,"Error",self)
        }
    }
}
