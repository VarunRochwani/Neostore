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
            orderDetailtableView.register(UINib(nibName: "FooterOrderDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "FooterOrderDetailTableViewCell")
            orderDetailtableView.tableFooterView =  UIView()
        }
    }
    var orderDetails :[OrderDetail]?
    var totalAmount:Int?
    let orderdetailViewModel = OrderDetailViewModel()
    var orderId:Int?
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getOrderDetail(orderId ?? 0)
        setUpNavBar(orderId ?? 0)
    }
}
