//
//  OrderDetailViewController.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    
    @IBOutlet weak var orderDetailtableView: UITableView!{
        didSet{
            orderDetailtableView.register(UINib(nibName: Constant.footerOrderDetailTableViewCell, bundle: nil), forCellReuseIdentifier: Constant.footerOrderDetailTableViewCell)
            orderDetailtableView.tableFooterView =  UIView()
        }
    }

    var totalAmount:Int?
    var orderId:Int?
    let orderdetailViewModel = OrderDetailViewModel()
    
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getOrderDetail(orderId ?? 0)
        setUpNavBar(orderId ?? 0)
    }
}
