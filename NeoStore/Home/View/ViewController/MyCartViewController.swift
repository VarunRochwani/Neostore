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
        
        navigationBarUtility.setTitle("My Cart", self)
        
        navigationBarUtility.configureRightBarButton(image:"search_icon",style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: "chevron.left", style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigate(storyBoard: "Home", identifier: "HomeViewController", vc: self)
    }

}
