//
//  Extension+ShippingAddressViewController.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import Foundation
import UIKit

extension ShippingAddressViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShippingAddressList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShippingAddressTableViewCell
        
        let footerCell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewCell", for: indexPath) as! FooterTableViewCell
        
        footerCell.placeOrderClicked = {
            self.placeOrderApi()
           }
        
        
        if indexPath.row == ShippingAddressList.count {
            return footerCell
        }else{
            if ShippingAddressList[indexPath.row].isSelected == true{
                cell.setImage(imageName: "checked")
            }else{
                cell.setImage(imageName: "unchecked")
            }
            cell.addressLbl.text = (ShippingAddressList[indexPath.row].address ?? "")
            cell.tag = indexPath.row
            cell.selectionStyle = .none
            cell.removebtnClick = { [weak self] iIndex in
                self?.ShippingAddressList.remove(at: iIndex)
                if let address = self?.addressList?[iIndex]{
                    self?.addressList?.remove(at: iIndex)
                    AppDelegate.sharedAppDelegate.coreDataStack.managedContext.delete(address)
                    AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
                }
                
                let rowIndexPath = IndexPath(row: iIndex, section: 0)
                tableView.deleteRows(at: [rowIndexPath], with: .automatic)
                tableView.reloadData()
                
            }
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            AppDelegate.sharedAppDelegate.coreDataStack.managedContext.delete(self.addressList?[indexPath.row] ?? Address())
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
            self.addressList?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            complete(true)
            
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ShippingAddressTableViewCell
        cell.setImage(imageName: "checked")
        ShippingAddressList[indexPath.row].isSelected = true
        
        
        
        selectedAddress =  ShippingAddressList[indexPath.row].address
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ShippingAddressTableViewCell{
            ShippingAddressList[indexPath.row].isSelected = false
            cell.setImage(imageName: "unchecked")
        }
    }
}


extension ShippingAddressViewController{
    
    func placeOrderApi(){
        if addressList?.count != 0 {
            guard let selectAddress = self.selectedAddress else{
                AlertUtility.showAlert("Please Select the Address","Address Not Selected", self)
                return
            }
            self.shippingAddressViewModel.placeTheOrder(selectAddress) { OrderResonseModel in
                if OrderResonseModel.status == 200{
                    AlertUtility.showAlert(OrderResonseModel.message,OrderResonseModel.userMsg,self)
                    
                    self.navigate(storyBoard: "Order", identifier: "OrderListViewController", vc: self)
                }
            }
        }
        else{
            AlertUtility.showAlert("please Add Address","Address Not added", self)
        }
    }
    
}
