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
        fetchAddressListData()
        setShippingAddressList()
        setUpNavBar()
    }
    
}

extension ShippingAddressViewController{
    
    func setUpTableView(){
        shippingAddressTableView.register(UINib(nibName: "FooterTableViewCell", bundle: nil), forCellReuseIdentifier: "FooterTableViewCell")
        
    }
    
    func fetchAddressListData(){
        let addressFetch: NSFetchRequest<Address> = Address.fetchRequest()
        
        do {
            let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try managedContext.fetch(addressFetch)
            addressList = results
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }
    func setShippingAddressList(){
        guard let list = addressList else{
            return
        }
        for i in 0..<list.count  {
            ShippingAddressList.append(shippingAddressAndBtn(address: addressList?[i].address,buttonImage: UIImage(named: "unchecked"),isSelected: false))
        }
                
    }
    
    func setUpNavBar(){
        
        navigationBarUtility.setTitle("Address List", self)
        
        
        
        let rightBarButtonImage = UIImage(systemName: "plus")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarButtonImage, style:.plain, target: self, action: #selector(rightButtonClick))
        self.navigationItem.rightBarButtonItem?.tintColor=UIColor.white
        
        navigationBarUtility.configureLeftBarButton(image: "chevron.left", style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func rightButtonClick(){
        self.navigate(storyBoard: "Order", identifier: "AddressViewController", vc: self)
    }
    
}


