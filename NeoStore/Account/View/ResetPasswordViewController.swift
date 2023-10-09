//
//  ResetPasswordViewController.swift
//  NeoStore
//
//  Created by neosoft on 10/09/23.
//

import UIKit

class ResetPasswordViewController: NavigationViewController {

    
    @IBOutlet weak var currentPasswordView: BorderedField!
    
    @IBOutlet weak var newPasswordView: BorderedField!
    
    @IBOutlet weak var confirmPasswordView: BorderedField!
    
    @IBOutlet weak var currentPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var resetPasswordBtn: UIButton!
    
    let resetPasswordViewModel = ResetPasswordViewModel()
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
    }

    @IBAction func resetPasswordAction(_ sender: Any) {
        
        let resetPasswordModel = ResetPasswordModel(oldPassword: currentPasswordTextField.text ?? "", password: newPasswordTextField.text ?? "", confirmPassword: confirmPasswordTextField.text ?? "")
        
        resetPasswordViewModel.resetPassword(resetPasswordModel) { result in
            if result.status == 200{
                AlertUtility.showAlert(result.message ?? "", result.message ?? "", self)
                self.navigate(storyBoard: Constant.mainStoryBoard, identifier: Constant.loginVcIdentifier, vc: self)
            }
            else{
                AlertUtility.showAlert(result.message ?? "", result.message ?? "", self)
            }
        }
    }
    
    func setUpNavBar(){
        navigationBarUtility.setTitle(Constant.resetPasswordTitle, self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }
    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
}
