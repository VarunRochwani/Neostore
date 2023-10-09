//
//  LoginViewController.swift
//  NeoStore
//
//  Created by apple on 08/08/23.
//

import UIKit

class LoginViewController: NavigationViewController {
    @IBOutlet weak var userNameView: BorderedField!
    @IBOutlet weak var passwordView: BorderedField!
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var forgotPasswordLbl: UILabel!
    @IBOutlet weak var plustBtnNavigateToRegister: UIButton!
    
    let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.white // Change this to your desired color
    ]

    let loginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        userName.attributedPlaceholder = NSAttributedString(string: Constant.username, attributes:attributes)
        password.attributedPlaceholder = NSAttributedString(string: Constant.password,attributes: attributes)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunc(_:)))
        self.forgotPasswordLbl.isUserInteractionEnabled = true
        self.forgotPasswordLbl.addGestureRecognizer(tap)
        
    }
    @IBAction func loginUser(_ sender: Any) {
        
        let loginCredentials = Credentials(email: userName.text!, password: password!.text!)
        
        loginViewModel.login(loginCredentials) { result in
            if result.status == 200{
                self.navigate(storyBoard: Constant.homeStoryBoard, identifier: Constant.homeVcIdentifier, vc: self)
                UserDefaults.standard.set(true, forKey: Constant.isLoggedInKey)
                UserDefaults.standard.set(result.data?.accessToken, forKey: Constant.accessTokenKey)
            }
            else{
                AlertUtility.showAlert(result.message ?? "", "something went wrong", self)
            }
        }
    }
    
    @IBAction func naviagetToRegister(_ sender: Any) {
        
        self.navigate(storyBoard: Constant.mainStoryBoard, identifier: Constant.registerVcIdentifier, vc: self)
        
    }

    @objc func tapFunc(_ gestureRecognizer: UITapGestureRecognizer) {
        self.navigate(storyBoard: Constant.mainStoryBoard, identifier: Constant.forgotPasswordVcIdentifier, vc: self)
    }

}

