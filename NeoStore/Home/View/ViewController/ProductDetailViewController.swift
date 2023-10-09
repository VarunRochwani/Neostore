//
//  ProductDetailViewController.swift
//  NeoStore
//
//  Created by neosoft on 28/08/23.
//

import UIKit


class ProductDetailViewController: NavigationViewController {

    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var starStackView: UIStackView!

    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var selectedProductImage: UIImageView!
    @IBOutlet weak var productImagesCollectionView: UICollectionView!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var buyNowBtn: UIButton!
    @IBOutlet weak var rateBtn: UIButton!

    var productId : Int?
    let productDetailViewModel = ProductDetailViewModel()
    var selectedImageUrl:String = ""

    var popUpVc:PopUpViewController?
    var rateNowPopUpVc:RatePopUpViewController?
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndSetUpProductDetails()
        setUpNavBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        productImagesCollectionView.reloadData()
    }
    
    @IBAction func buyNowClicked(_ sender: Any) {
        popUpVc = PopUpViewController(image:selectedImageUrl , name: productDetailViewModel.productDetail?.name ?? "")
        popUpVc?.modalPresentationStyle = .overCurrentContext
        popUpVc?.modalTransitionStyle = .crossDissolve
        popUpVc?.popUpNavigationDelegate = self
        popUpVc?.productId = productId ?? 0
        present(popUpVc ?? UIViewController(), animated: true, completion: nil)
    }
    
    @IBAction func rateNowBtnClick(_ sender: Any) {
        
        rateNowPopUpVc = RatePopUpViewController(image: selectedImageUrl, name: productDetailViewModel.productDetail?.name ?? "", rating: productDetailViewModel.productDetail?.rating ?? 0)
        rateNowPopUpVc?.productId = productId ?? 0
        rateNowPopUpVc?.modalPresentationStyle = .overCurrentContext
        rateNowPopUpVc?.modalTransitionStyle = .crossDissolve
        present(rateNowPopUpVc ?? UIViewController(), animated: true, completion: nil)
    }
    

}
