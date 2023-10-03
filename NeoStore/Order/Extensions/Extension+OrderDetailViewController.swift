//
//  Extension+OrderDetailViewController.swift
//  NeoStore
//
//  Created by neosoft on 12/09/23.
//

import Foundation
import UIKit

extension OrderDetailViewController{
    
    func getOrderDetail(_ orderId:Int){
        orderdetailViewModel.fetchOrderDetails(orderId) { detailResponse in
            
            if detailResponse.status == 200{
                self.orderDetails = detailResponse.data?.orderDetails
                self.totalAmount = detailResponse.data?.cost
                self.orderDetailtableView.reloadData()
            }
        }
    }
    func setUpNavBar(_ orderId:Int){
        
        navigationBarUtility.setTitle(" Order ID: \(orderId)", self)
        
        navigationBarUtility.configureRightBarButton(image:"search_icon",style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: "chevron.left", style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension OrderDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (orderDetails?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == orderDetails?.count {
            let footerCell = tableView.dequeueReusableCell(withIdentifier: "FooterOrderDetailTableViewCell", for: indexPath) as! FooterOrderDetailTableViewCell
            footerCell.backgroundColor = .blue
            footerCell.selectionStyle = .none
            footerCell.totalAmtLbl.text = "\(totalAmount ?? 0)"
            
            return footerCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailTableViewCell", for: indexPath) as! OrderDetailTableViewCell
            cell.selectionStyle = .none
            cell.productName.text = orderDetails?[indexPath.row].prodName
            cell.quantityLbl.text = "\(orderDetails?[indexPath.row].quantity ?? 0)"
            cell.rateLbl.text = "₹ \(orderDetails?[indexPath.row].total ?? 0)"
            cell.productCategory.text = "(\(orderDetails?[indexPath.row].prodCatName ?? "")) "
            cell.setImage(orderDetails?[indexPath.row].prodImage ?? "")
     
            return cell
        }
       
           
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == orderDetails?.count {
            return 80
        } else {
            return UITableView.automaticDimension
        }
       
    }
     
}
