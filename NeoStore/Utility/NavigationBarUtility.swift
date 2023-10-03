//
//  NavigationBarUtility.swift
//  NeoStore
//
//  Created by neosoft on 28/08/23.
//

import Foundation
import UIKit

class NavigationBarUtility:UINavigationController{
   
//    static func getNavigationBarUtility() -> NavigationBarUtility{
//        return NavigationBarUtility()
//    }
    
    func setTitle(_ title:String,_ vc:UIViewController){
        vc.navigationItem.titleView?.tintColor = .white
        vc.navigationItem.title = title
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,.font:UIFont(name: "HelveticaNeue-Medium", size: 25.0)]
        vc.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
    
    func configureLeftBarButton(image:String,style:UIBarButtonItem.Style,target:Any?, action: Selector?,vc:UIViewController){
        

        let leftBarButtonImage = UIImage(systemName:image)
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarButtonImage, style:style, target: target, action: action)
        vc.navigationItem.leftBarButtonItem?.tintColor=UIColor.white
        vc.navigationItem.leftBarButtonItem?.title = " "
    }
    
    func configureRightBarButton(image:String,style:UIBarButtonItem.Style,target:Any?,action:Selector?,vc:UIViewController){
        let rightBarButtonImage = UIImage(named: image)
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarButtonImage, style:style, target: target, action: action)
        vc.navigationItem.rightBarButtonItem?.tintColor=UIColor.white
    }
    
}



