//
//  AppDelegate.swift
//  NeoStore
//
//  Created by apple on 08/08/23.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController : UINavigationController?
    lazy var coreDataStack: CoreDataStack = .init(modelName: "AddressList")

       static let sharedAppDelegate: AppDelegate = {
           guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
               fatalError("Unexpected app delegate type, did it change? \(String(describing: UIApplication.shared.delegate))")
           }
           return delegate
       }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        window = UIWindow(frame: UIScreen.main.bounds)


        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .red
        
        
        if isLoggedIn(){
           let storyBoard = UIStoryboard(name: "Home", bundle: nil)
            let homeVc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
             navigationController = UINavigationController(rootViewController: homeVc)
                        window?.rootViewController = navigationController
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
             let LoginVc = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
              navigationController = UINavigationController(rootViewController: LoginVc)
                         window?.rootViewController = navigationController
        }
        window?.makeKeyAndVisible()
        
        return true
    }
 

    func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

}

