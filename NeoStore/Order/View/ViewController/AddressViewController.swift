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
    
    let navigationBarUtility = NavigationBarUtility()
    
    let addressViewModel = AddressViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
    }
    
    func setUpNavBar(){
        
        navigationBarUtility.setTitle(Constant.addAddressTitle, self)
        
        navigationBarUtility.configureRightBarButton(image:Images.searchIcon,style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveAddress(_ sender: Any) {
        
        let addressModel = AddressModel(address: addressTextView.text, landmark: landMarkTextField.text ?? "", city: city.text ?? "", state: stateTextField.text ?? "", country: countryTextField.text ?? "", zipcode: zipCodeTextFeild.text ?? "")
        
        addressViewModel.saveAddress(address: addressModel)
        
        self.navigate(storyBoard: Constant.orderStoryBoard, identifier: Constant.shippingAddressViewController, vc: self)
        
    }
    
}
