//
//  Extension+ProductDetailViewController.swift
//  NeoStore
//
//  Created by neosoft on 28/08/23.
//

import Foundation
import UIKit

extension ProductDetailViewController{
    func fetchAndSetUpProductDetails(){
        productDetailViewModel.getProductDetail(productId ?? 0) { [self] ProductDetail in
//            productDetail = productDetailViewModel.productDetail
            navigationBarUtility.setTitle(productDetailViewModel.productDetail?.name ?? "", self)
            self.productNameLbl.text = productDetailViewModel.productDetail?.name
            self.producerLbl.text = productDetailViewModel.productDetail?.producer
            setProductCategory(productDetailViewModel.productDetail?.productCategoryID ?? 0)
            setProductRating(productDetailViewModel.productDetail?.rating ?? 0)
            costLbl.text = "Rs.\(productDetailViewModel.productDetail?.cost)"
            descriptionLbl.text = productDetailViewModel.productDetail?.description
            loadImage(productDetailViewModel.productDetail?.productImages[0].image ?? "")
            selectedImageUrl=productDetailViewModel.productDetail?.productImages[0].image ?? ""
        }
        
    }
    
    func setProductCategory(_ productCategoryId:Int){
        switch productCategoryId{
        case 1:
            self.categoryNameLbl.text = "Category-Tables"
            break
        case 2:
            self.categoryNameLbl.text = "Category-Chairs"
            break
        case 3:
            self.categoryNameLbl.text = "Category-Sofa"
            break
        case 4:
            self.categoryNameLbl.text = "Category-CupBoard"
            break
        default:
            break
        }
    }
    
    func setProductRating(_ rating:Int){
        
        switch rating{
        case 1:
            self.star1.image = UIImage(named: Images.checkedStar)
            break
        case 2:
            self.star1.image = UIImage(named: Images.checkedStar)
            self.star2.image = UIImage(named: Images.checkedStar)
            break
        case 3:
            self.star1.image = UIImage(named: Images.checkedStar)
            self.star2.image = UIImage(named: Images.checkedStar)
            self.star3.image = UIImage(named: Images.checkedStar)
            break
        case 4:
            self.star1.image = UIImage(named: Images.checkedStar)
            self.star2.image = UIImage(named: Images.checkedStar)
            self.star3.image = UIImage(named: Images.checkedStar)
            self.star4.image = UIImage(named: Images.checkedStar)
            break
        case 5:
            self.star1.image = UIImage(named: Images.checkedStar)
            self.star2.image = UIImage(named: Images.checkedStar)
            self.star3.image = UIImage(named: Images.checkedStar)
            self.star4.image = UIImage(named: Images.checkedStar)
            self.star5.image = UIImage(named: Images.checkedStar)
            break
        default:
            break
        }
    }
    
    func loadImage(_ Url:String){
        if let img = URL(string: Url) {
            URLSession.shared.dataTask(with: img) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                       
                        self.selectedProductImage.image = image
                    }
                }
            }.resume()
        }
    }
    
    func setUpNavBar(){
        navigationBarUtility.configureRightBarButton(image:"search_icon",style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: "chevron.left", style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
}


extension ProductDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return productDetailViewModel.productDetail?.productImages.count ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for:indexPath ) as! ProductDetailCollectionViewCell
            
            cell.setProductCellImage((productDetailViewModel.productDetail?.productImages[indexPath.row])!)
            if indexPath.row == 0{
                collectionView.cellForItem(at: indexPath)?.isSelected = true
            }
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
            
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (productImagesCollectionView.frame.size.width-30)/3, height: productImagesCollectionView.frame.size.height)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            selectedImageUrl = productDetailViewModel.productDetail?.productImages[indexPath.row].image ?? ""
            
            loadImage(productDetailViewModel.productDetail?.productImages[indexPath.row].image ?? "")
            
            var selectedIndexPath :IndexPath?
            
            if let previousSelectedIndexPath = selectedIndexPath {
                    collectionView.cellForItem(at: previousSelectedIndexPath)?.isSelected = false
                }
            
            selectedIndexPath = indexPath
            collectionView.cellForItem(at: indexPath)?.isSelected = true
            
        }
    
    
        
    }
extension ProductDetailViewController:PopDismissDelegate{
    func didSubmitButton() {
        popUpVc?.dismiss(animated: true)
        self.navigate(storyBoard: "Home", identifier: "MyCartViewController", vc: self)
    }
    
    
}

