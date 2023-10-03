//
//  extennsion+ProductListViewController.swift
//  NeoStore
//
//  Created by Shraddha Ghadage on 27/08/2023.
//

import Foundation
import UIKit
import iOSDropDown

extension ProductListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductListTableViewCell
        
        cell.configureCell(productListData![indexPath.row])
        cell.setRating(productListData![indexPath.row].rating!)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let productDetailVC = storyBoard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController

        productDetailVC.productId = productListData?[indexPath.row].id
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}

extension ProductListViewController {
    func fetchProductListData(){
        productListViewModel.fetchProductList(productCategoryId) { result in
            print(result?.data)
            self.productListData = result?.data
            self.productListTableView.reloadData()
        }
    }
    func configureNavBar(_ productCategoryId:Int){
        
        switch productCategoryId{
            
        case 1:
            navigationBarUtility.setTitle("Tables", self)
            break
        case 2:
            navigationBarUtility.setTitle("Chairs", self)
            break
        case 3:
            navigationBarUtility.setTitle("Sofa", self)
            break
        case 4:
            navigationBarUtility.setTitle("CupBoard", self)
            break
        default:
            break
        }
        
        navigationBarUtility.configureRightBarButton(image:"search_icon",style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: "chevron.left", style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }
   
    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
}

