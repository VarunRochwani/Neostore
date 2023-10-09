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
                self.totalAmount = detailResponse.data?.cost
                self.orderDetailtableView.reloadData()
            }
        }
    }
    func setUpNavBar(_ orderId:Int){
        
        navigationBarUtility.setTitle(" \(Constant.orderDetailTitle) \(orderId)", self)
        
        navigationBarUtility.configureRightBarButton(image:Images.searchIcon,style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension OrderDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderdetailViewModel.getOrderDetailCount() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == orderdetailViewModel.getOrderDetails()?.count {
            let footerCell = tableView.dequeueReusableCell(withIdentifier: Constant.footerOrderDetailTableViewCell, for: indexPath) as! FooterOrderDetailTableViewCell
            footerCell.backgroundColor = .blue
            footerCell.selectionStyle = .none
            footerCell.totalAmtLbl.text = "\(totalAmount ?? 0)"
            
            return footerCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.orderDetailTableViewCell, for: indexPath) as! OrderDetailTableViewCell
            cell.selectionStyle = .none
            cell.productName.text = orderdetailViewModel.getOrderDetails()?[indexPath.row].prodName
            cell.quantityLbl.text = "\(orderdetailViewModel.getOrderDetails()?[indexPath.row].quantity ?? 0)"
            cell.rateLbl.text = "₹ \(orderdetailViewModel.getOrderDetails()?[indexPath.row].total ?? 0)"
            cell.productCategory.text = "(\(orderdetailViewModel.getOrderDetails()?[indexPath.row].prodCatName ?? "")) "
            cell.setImage(orderdetailViewModel.getOrderDetails()?[indexPath.row].prodImage ?? "")
     
            return cell
        }
       
           
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == orderdetailViewModel.getOrderDetailCount() {
            return 80
        } else {
            return UITableView.automaticDimension
        }
       
    }
     
}
