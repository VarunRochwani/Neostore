//
//  NavigationViewController.swift
//  NeoStore
//
//  Created by neosoft on 21/09/23.
//

import UIKit

class NavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func navigate(storyBoard:String,identifier:String,vc:UIViewController){
        
        let storyBoard = UIStoryboard(name: storyBoard, bundle: nil)
        let destinationVc = storyBoard.instantiateViewController(withIdentifier: identifier) 
        vc.navigationController?.pushViewController(destinationVc, animated: true)
        
    }

}
