//
//  MyCartViewController.swift
//  NeoStore
//
//  Created by neosoft on 05/09/23.
//

import UIKit

class MyCartViewController: NavigationViewController {
    
    
    @IBOutlet weak var myCartTableView: UITableView!
    
    let myCartViewModel = MyCartViewModel()

    var quantity:Int = 0
    var totalAmt = 0
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCartDetails()
        setUpTableView()
        setUpNavBar()
    }
    
    func setUpNavBar(){
        
        navigationBarUtility.setTitle(Constant.myCartTitle, self)
        
        navigationBarUtility.configureRightBarButton(image:Images.searchIcon,style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigate(storyBoard: Constant.homeStoryBoard, identifier: Constant.homeVcIdentifier, vc: self)
    }

}
