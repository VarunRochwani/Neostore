//
//  ProductListViewController.swift
//  NeoStore
//
//  Created by neosoft on 25/08/23.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productImage : UIImage!
    @IBOutlet weak var productNameLbl : UIImage!
    @IBOutlet weak var productListTableView : UITableView!
    
    var productCategoryId:Int = 0
    let productListViewModel = ProductListViewModel()
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProductListData()
        configureNavBar(productCategoryId)
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        <#code#>
//    }
    
    
}


