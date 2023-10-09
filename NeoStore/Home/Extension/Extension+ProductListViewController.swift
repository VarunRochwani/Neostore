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
        return productListViewModel.productListData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.productListTableViewCell) as! ProductListTableViewCell
        cell.configureCell(productListViewModel.productListData![indexPath.row])
        cell.setRating(productListViewModel.productListData![indexPath.row].rating!)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: Constant.homeStoryBoard , bundle: nil)
        let productDetailVC = storyBoard.instantiateViewController(withIdentifier: Constant.productDetailVcIdentifier) as! ProductDetailViewController

        productDetailVC.productId = productListViewModel.productListData?[indexPath.row].id
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}

extension ProductListViewController {
    func fetchProductListData(){
        productListViewModel.fetchProductList(productCategoryId) { result in
            self.productListTableView.reloadData()
        }
    } 
    func configureNavBar(_ productCategoryId:Int){
        
        switch productCategoryId{
            
        case 1:
            navigationBarUtility.setTitle(Constant.categoryTable, self)
            break
        case 2:
            navigationBarUtility.setTitle(Constant.categoryChair, self)
            break
        case 3:
            navigationBarUtility.setTitle(Constant.categorySofa, self)
            break
        case 4:
            navigationBarUtility.setTitle(Constant.categoryCupboard, self)
            break
        default:
            break
        }
        
        navigationBarUtility.configureRightBarButton(image:Images.searchIcon,style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }
   
    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
}


