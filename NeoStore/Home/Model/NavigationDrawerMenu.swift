//
//  optionsMenu.swift
//  NeoStore
//
//  Created by neosoft on 31/08/23.
//

import Foundation
import UIKit

struct DrawerOptions{
    var optionsList:[Option] = []
    
    init(){
        self.setUpMenu()
    }
    
    mutating func setUpMenu(){
        let option1 = Option(optionImage: UIImage(named: "shoppingcart_icon") ?? UIImage(), optionlabel:"MyCart", OptionId: 0)
        optionsList.append(option1)
        
        let option2 = Option(optionImage: UIImage(named: "table") ?? UIImage(), optionlabel:"Tables", OptionId: 1)
        optionsList.append(option2)
        
        let option3 = Option(optionImage: UIImage(named: "sofa") ?? UIImage(), optionlabel:"Sofas", OptionId: 3)
        optionsList.append(option3)
        
        let option4 = Option(optionImage: UIImage(named: "chair") ?? UIImage(), optionlabel:"Chairs", OptionId: 2)
        optionsList.append(option4)
        
        let option5 = Option(optionImage: UIImage(named: "cupboard") ?? UIImage(), optionlabel:"Cupboard", OptionId: 4)
        optionsList.append(option5)
        
        let option6 = Option(optionImage: UIImage(named: "username_icon") ?? UIImage(), optionlabel:"My Account", OptionId: 5)
        optionsList.append(option6)
        
        let option7 = Option(optionImage: UIImage(named: "storelocator_icon") ?? UIImage(), optionlabel:"Store Locator", OptionId: 6)
        optionsList.append(option7)
        
        let option8 = Option(optionImage: UIImage(named: "myorders_icon") ?? UIImage(), optionlabel:"My Orders", OptionId: 7)
        optionsList.append(option8)
        
        let option9 = Option(optionImage: UIImage(named: "logout_icon") ?? UIImage(), optionlabel:"Logout", OptionId: 8)
        optionsList.append(option9)
    }
}
struct Option{
    let optionImage:UIImage
    let optionlabel:String
    let OptionId:Int
}
