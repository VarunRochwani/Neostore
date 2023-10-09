//
//  OrderListViewController.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import UIKit

class OrderListViewController: NavigationViewController {
    
    
    @IBOutlet weak var orderListTableView: UITableView!{
        didSet{
            orderListTableView.tableFooterView = UIView()
        }
    }
    
    let orderListViewModel = OrderListViewModel()
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getOrderList()
        setUpNavBar()
    }
}

