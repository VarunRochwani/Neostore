//
//  AddressViewController.swift
//  NeoStore
//
//  Created by neosoft on 01/09/23.
//

import UIKit

class AddressViewController: NavigationViewController {
    
    
    @IBOutlet weak var addressTextView: UITextView!
    
    @IBOutlet weak var landMarkTextField: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var zipCodeTextFeild: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var saveAddressBtn: ButtonStyle!
    
    var address = [Address]()
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
    }
    
    func setUpNavBar(){
        
        navigationBarUtility.setTitle("Add Address", self)
        
        navigationBarUtility.configureRightBarButton(image:"search_icon",style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: "chevron.left", style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveAddress(_ sender: Any) {
        
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let newAddress = Address(context: managedContext)
        newAddress.setValue(addressTextView.text, forKey: #keyPath(Address.address))
        newAddress.setValue(landMarkTextField.text, forKey: #keyPath(Address.landmark))
        newAddress.setValue(city.text, forKey: #keyPath(Address.city))
        newAddress.setValue(stateTextField.text, forKey: #keyPath(Address.state))
        newAddress.setValue(countryTextField.text, forKey:#keyPath(Address.country))
        newAddress.setValue(Double(zipCodeTextFeild.text ?? ""), forKey:#keyPath(Address.zipcode))
        
        self.address.insert(newAddress, at: 0)
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        
        self.navigate(storyBoard: "Order", identifier: "ShippingAddressViewController", vc: self)
        
    }
    
}
