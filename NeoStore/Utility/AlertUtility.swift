//
//  AlertUtility.swift
//  NeoStore
//
//  Created by neosoft on 25/08/23.
//

import UIKit
import Foundation

class AlertUtility : UIViewController{
    
    private init(){
        super.init(nibName: "", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func showAlert(_ message:String,_ title:String,_ viewController:UIViewController) {
            let alert = UIAlertController(title:title , message: message, preferredStyle: .alert)
              
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                viewController.dismiss(animated: true)
            }))
            DispatchQueue.main.async {
                viewController.present(alert, animated: false, completion: nil)
            }
        }
}
