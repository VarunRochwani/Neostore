//
//  ForgotPasswordViewController.swift
//  NeoStore
//
//  Created by apple on 09/08/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var forgotEmailView : BorderedField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    let forgotPasswordViewModel = ForgotPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotEmailView.setupUI()
    }
    
    @IBAction func continueBtnClick(_ sender: Any) {
        
        guard let emailText = emailTextField.text else{
            return
        }
        
        if( forgotPasswordViewModel.checkEmptyValidation(emailText)){
            forgotPasswordViewModel.forgotPassword(emailText) { Response in
                AlertUtility.showAlert(Response.message ?? "", "Check Your Email", self)
                let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.navigationController?.pushViewController( loginViewController, animated: true)
            }
        }
    }
    

}
