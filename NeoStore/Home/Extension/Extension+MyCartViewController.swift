//
//  Extension+MyCartViewController.swift
//  NeoStore
//
//  Created by neosoft on 05/09/23.
//

import Foundation
import UIKit

extension MyCartViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cartItems = myCartViewModel.cartList
        else{
            return 0
        }
        
        return cartItems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let orderNowTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constant.orderNowTableViewCell, for: indexPath) as! OrderNowTableViewCell
        
        switch indexPath.row{
        case myCartViewModel.cartList?.count:
            orderNowTableViewCell.totalAmt.text = "₹.\(self.totalAmt)"
            orderNowTableViewCell.orderNowClick = {
                self.navigate(storyBoard: Constant.orderStoryBoard, identifier: Constant.shippingAddressViewController, vc: self)
            }
            return orderNowTableViewCell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.myCartTableViewCell, for: indexPath) as! MyCartTableViewCell
            
            cell.selectionStyle = .none
            cell.productNameLbL.text = myCartViewModel.cartList?[indexPath.row].product.name
            
            if let img = URL(string: myCartViewModel.cartList?[indexPath.row].product.productImages ?? "") {
                URLSession.shared.dataTask(with: img) { (data, response, error) in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            cell.productImage.image = image
                        }
                    }
                }.resume()
            }
            cell.productCategory.text = myCartViewModel.cartList?[indexPath.row].product.productCategory
            cell.quantityDropDown.text = "\(myCartViewModel.cartList?[indexPath.row].quantity ?? 0)"
            quantity = myCartViewModel.cartList?[indexPath.row].quantity ?? 0
            cell.rateLbl.text = "₹.\(quantity * (myCartViewModel.cartList?[indexPath.row].product.cost ?? 0) ).00"
            cell.selectionAction = { [weak self] (item: String) in
                guard let _ = self else { return }
                cell.quantityDropDown.text = item
                
                let param = [Constant.productId:self?.myCartViewModel.cartList?[indexPath.row].product.id ?? 0,Constant.quantity:item]
                
                //Edit cart Api call
                self?.myCartViewModel.editCartData(param) { detailResponse in
                    print(detailResponse.message)
                    
                    self?.fetchCartDetails()
                }
            }
            return cell
        }
        
    }

    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in

                let param = [Constant.productId: self.myCartViewModel.cartList?[indexPath.row].product.id]
                self.myCartViewModel.deleteCartData(param as [String : Any]) { detailResponse in
                    self.fetchCartDetails()
                    complete(true)
                }
            }
            
        deleteAction.image = UIImage(named: Images.delete)
            deleteAction.backgroundColor = .white
            
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            configuration.performsFirstActionWithFullSwipe = true
        
            return configuration
        }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }

}

extension MyCartViewController{
    func fetchCartDetails(){
        myCartViewModel.fetchCartData({ detailResponse in
          if detailResponse.status == 200{
              
              //self.cartList = detailResponse.data
              self.totalAmt = detailResponse.total ?? 0
              DispatchQueue.main.async {
                  self.myCartTableView.reloadData()
              }
              if let message = detailResponse.message{
                  AlertUtility.showAlert(message, detailResponse.userMsg ?? "", self)
              }
            }
        })
    }
    
    func setUpTableView(){
        myCartTableView.register(UINib(nibName: Constant.orderNowTableViewCell, bundle: nil), forCellReuseIdentifier: Constant.orderNowTableViewCell)
        myCartTableView.tableFooterView = UIView()
    }

}
