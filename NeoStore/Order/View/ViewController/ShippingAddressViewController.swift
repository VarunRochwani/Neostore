//
//  ShippingAddressViewController.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import UIKit
import CoreData

class ShippingAddressViewController: NavigationViewController {
    
    @IBOutlet weak var shippingAddressTableView: UITableView!
    
    var button = UIButton(type: .system)
    var addressList : [Address]?
    var ShippingAddressList:[shippingAddressAndBtn] = []
    var selectedAddress:String?
    
    let shippingAddressViewModel = ShippingAddressViewModel()
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        //fetchAddressListData()
        setShippingAddressList()
        setUpNavBar()
    }
    
}

extension ShippingAddressViewController{
    
    func setUpTableView(){
        shippingAddressTableView.register(UINib(nibName: Constant.footerTableViewCell, bundle: nil), forCellReuseIdentifier: Constant.footerTableViewCell)
        
    }
    
    func setShippingAddressList(){
        addressList = shippingAddressViewModel.fetchAddressListData()

        ShippingAddressList = shippingAddressViewModel.setShippingAddressList()
    }
    
    func setUpNavBar(){
        
        navigationBarUtility.setTitle(Constant.addressListTitle, self)
     
        let rightBarButtonImage = UIImage(systemName: Images.add)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarButtonImage, style:.plain, target: self, action: #selector(rightButtonClick))
        self.navigationItem.rightBarButtonItem?.tintColor=UIColor.white
        
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func rightButtonClick(){
        self.navigate(storyBoard: Constant.orderStoryBoard, identifier: Constant.addressVcIdentifier, vc: self)
    }
    
}


