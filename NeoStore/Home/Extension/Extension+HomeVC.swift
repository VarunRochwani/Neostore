//
//  ex+HomeVC.swift
//  NeoStore
//
//  Created by apple on 09/08/23.
//

import Foundation
import UIKit
import NavigationDrawer

extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeImageSlider{
            return homeSliderContent.count
        }
        return productContent.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = homeImageSlider.dequeueReusableCell(withReuseIdentifier: "slider", for: indexPath) as! SliderCollectionViewCell
        if collectionView == homeImageSlider{
            cell.sliderImg.image = homeSliderContent[indexPath.row].contentImage
            return cell
            
        }else if collectionView == productCollectionView {
            cell.sliderImg.image = productContent[indexPath.row].contentImage
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView==productCollectionView{
            return 10.0
        }
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == productCollectionView{
            let contentId = productContent[indexPath.row].contentId
            presentProductListViewController(contentId!)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == homeImageSlider{
            return CGSize(width: homeImageSlider.frame.size.width, height: homeImageSlider.frame.size.height)
        }
        else{
            return CGSize(width: (productCollectionView!.frame.size.width-10)/2, height: (productCollectionView!.frame.size.height-10)/2)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }

}

extension HomeViewController{
    func setUpPageControl(){
        sliderPageControl.numberOfPages = homeSliderContent.count
        sliderPageControl.currentPage = 0
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / view.frame.width
        sliderPageControl.currentPage = Int(scrollPos)
    }
    
    func presentProductListViewController(_ contentId:Int){
        let storyBoard =  UIStoryboard(name: Constant.homeStoryBoard, bundle: nil)
        let productListViewController = storyBoard.instantiateViewController(identifier: Constant.productListVcIdentifier) as ProductListViewController
        productListViewController.productCategoryId = contentId
        
        self.navigationController?.pushViewController(productListViewController, animated: true)
    }
    
    func configureNavigationBar(){

        self.navigationController?.navigationBar.barTintColor = .red
        self.navigationController?.navigationBar.isHidden = false
        navigationBarUtility.setTitle(Constant.neostoreTitle, self)
        navigationBarUtility.configureRightBarButton(image:Images.searchIcon,style:.plain,target:self,action:#selector(onMenuClick),vc: self)
    }
    @objc func onMenuClick(){
        
    }

    
    func navigateToNavigationDrawersMenu(_ index:Int){
        let homeStoryBoard = UIStoryboard(name: Constant.homeStoryBoard, bundle: nil)
//
//        let orderStoryBoard = UIStoryboard(name: "Order", bundle: nil)
//        let accountStoryBoard = UIStoryboard(name: "Account", bundle: nil)
        let mainStoryBoard = UIStoryboard(name: Constant.mainStoryBoard, bundle: nil)
        
        switch index{
        case 0:
            self.navigate(storyBoard: Constant.homeStoryBoard, identifier: Constant.myCartVcIdentifier, vc: self)
            break
        case 1,2,3,4:
            
            let productListVc = homeStoryBoard.instantiateViewController(withIdentifier: Constant.productListVcIdentifier) as! ProductListViewController
            productListVc.productCategoryId = index
            self.navigationController?.pushViewController(productListVc, animated: true)
            
            break
        case 5:
            self.navigate(storyBoard: Constant.accountStoryBoard, identifier: Constant.myAccountVcIdentifier, vc: self)
            break
        case 6:
            self.navigate(storyBoard: Constant.homeStoryBoard, identifier: Constant.myStoreVcIdentifier, vc: self)
            break
        case 7:
            self.navigate(storyBoard: Constant.orderStoryBoard, identifier: Constant.orderListVcIdentifier, vc: self)
            
            break
        case 8:
            UserDefaults.standard.set(false, forKey: Constant.isLoggedIn)
            let loginVc = mainStoryBoard.instantiateViewController(withIdentifier: Constant.loginVcIdentifier) as! LoginViewController
            self.navigationController?.pushViewController(loginVc, animated: true)
            self.navigationController?.navigationBar.isHidden = true
            break
        default:
            break
        }
    }
}

extension HomeViewController:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentMenuAnimator(direction: .Left)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissMenuAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? SlidingViewController {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = self.interactor
            destinationViewController.navigateToHomeVc={ data in
                
            self.navigateToNavigationDrawersMenu(data)
                
            }
        }
    }

}
