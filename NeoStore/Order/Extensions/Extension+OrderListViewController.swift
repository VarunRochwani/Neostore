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
//                self.orderList = detailResponse.data
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
        orderListViewModel.getOrderListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.orderListTableViewCell, for: indexPath) as! OrderListTableViewCell
        
        cell.orderIdLbl.text = "\(Constant.orderIdLbl) \(orderListViewModel.getOrderList()[indexPath.row].id)"
        cell.orderDate.text = "\(Constant.orderDateLbl) "+orderListViewModel.getOrderList()[indexPath.row].created
        cell.orderAmount.text = "₹ \(orderListViewModel.getOrderList()[indexPath.row].cost)"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let orderStoryBoard = UIStoryboard(name: Constant.orderStoryBoard, bundle: nil)
        let orderDetailVc = orderStoryBoard.instantiateViewController(withIdentifier: Constant.orderDetailVcIdentifier) as! OrderDetailViewController
        orderDetailVc.orderId = orderListViewModel.getOrderList()[indexPath.row].id
        self.navigationController?.pushViewController(orderDetailVc, animated: true)
    }
    
    func setUpNavBar(){
        
        navigationBarUtility.setTitle(Constant.myOrders, self)
        
        navigationBarUtility.configureRightBarButton(image:Images.searchIcon,style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigate(storyBoard:Constant.homeStoryBoard, identifier: Constant.homeVcIdentifier, vc: self)
    }
}
