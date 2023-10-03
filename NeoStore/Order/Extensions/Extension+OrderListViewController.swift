//
//  Extension+OrderListViewController.swift
//  NeoStore
//
//  Created by neosoft on 12/09/23.
//

import Foundation
import UIKit


extension OrderListViewController{
    
    func getOrderList(){
        
        orderListViewModel.fetchOrderList { detailResponse in
            if detailResponse.status == 200{
                self.orderList = detailResponse.data
                self.orderListTableView.reloadData()
            }
            else{
                AlertUtility.showAlert(detailResponse.message, detailResponse.user_msg, self)
            }
        }
    }
}
extension OrderListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell", for: indexPath) as! OrderListTableViewCell
        
        cell.orderIdLbl.text = "Order ID: \(orderList[indexPath.row].id)"
        cell.orderDate.text = "Order Date: "+orderList[indexPath.row].created
        cell.orderAmount.text = "₹ \(orderList[indexPath.row].cost)"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let orderStoryBoard = UIStoryboard(name: "Order", bundle: nil)
        let orderDetailVc = orderStoryBoard.instantiateViewController(withIdentifier: "OrderDetailViewController") as! OrderDetailViewController
        orderDetailVc.orderId = orderList[indexPath.row].id
        self.navigationController?.pushViewController(orderDetailVc, animated: true)
    }
    
    func setUpNavBar(){
        
        navigationBarUtility.setTitle("My Orders", self)
        
        navigationBarUtility.configureRightBarButton(image:"search_icon",style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: "chevron.left", style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigate(storyBoard: "Home", identifier: "HomeViewController", vc: self)
    }
}
