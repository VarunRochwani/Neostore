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
        let option1 = Option(optionImage: UIImage(named: Images.shoppingCartIcon) ?? UIImage(), optionlabel:Constant.myCart, OptionId: 0)
        optionsList.append(option1)
        
        let option2 = Option(optionImage: UIImage(named: Images.tableIcon) ?? UIImage(), optionlabel:Constant.tables, OptionId: 1)
        optionsList.append(option2)
        
        let option3 = Option(optionImage: UIImage(named: Images.sofaIcon) ?? UIImage(), optionlabel:Constant.sofas, OptionId: 3)
        optionsList.append(option3)
        
        let option4 = Option(optionImage: UIImage(named: Images.chairIcon) ?? UIImage(), optionlabel:Constant.chairs, OptionId: 2)
        optionsList.append(option4)
        
        let option5 = Option(optionImage: UIImage(named: Images.cupboardIcon) ?? UIImage(), optionlabel: Constant.cupboard, OptionId: 4)
        optionsList.append(option5)
        
        let option6 = Option(optionImage: UIImage(named:Images.userNameIcon) ?? UIImage(), optionlabel:Constant.myAccount, OptionId: 5)
        optionsList.append(option6)
        
        let option7 = Option(optionImage: UIImage(named: Images.storeLocatorIcon) ?? UIImage(), optionlabel:Constant.storeLocator, OptionId: 6)
        optionsList.append(option7)
        
        let option8 = Option(optionImage: UIImage(named: Images.myOrdersIcon) ?? UIImage(), optionlabel:Constant.orders, OptionId: 7)
        optionsList.append(option8)
        
        let option9 = Option(optionImage: UIImage(named: Images.logoutIcon) ?? UIImage(), optionlabel:Constant.logOut, OptionId: 8)
        optionsList.append(option9)
    }
}
struct Option{
    let optionImage:UIImage
    let optionlabel:String
    let OptionId:Int
}
