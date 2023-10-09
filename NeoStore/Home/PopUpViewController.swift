//
//  PopUpViewController.swift
//  NeoStore
//
//  Created by neosoft on 05/09/23.
//

import UIKit
import Alamofire

protocol PopDismissDelegate{
    func didSubmitButton()
}
class PopUpViewController: UIViewController {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var submitBtn: UIButton!

    @IBOutlet weak var popUpView: UIView!
    var productId = 0
    let httpUtility = HttpUtility.getUtility()
    
    var popUpNavigationDelegate:ProductDetailViewController!

    let addToCartViewModel = AddToCartViewModel()
    
    var productNameText = ""
    var pImage = ""
    required init?(coder: NSCoder) {
        fatalError("initialization failed")
    }
    
    init(image:String,name:String){
        super.init(nibName: nil, bundle: nil)
        self.productNameText = name
        self.pImage = image
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        productName.text = productNameText
        self.productImage.loadImage(imgString: pImage)

    }
    
    @IBAction func removeBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }

    @IBAction func submitBtnClicked(_ sender: Any) {
        let quantity = Int(quantity.text ?? "")
        addToCartViewModel.delegate = self
        addToCartViewModel.callAddtoCartApi(quantity ?? 0,productId)
    }

}

extension PopUpViewController:AddTocartDelegate{
    func getAddtoCartResponse(_ apiResponse:AddToCartApiResponse) {
        
        let alert = UIAlertController(title:apiResponse.userMsg , message: apiResponse.message, preferredStyle: .alert)
     
        if apiResponse.status == 200{
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                self.popUpNavigationDelegate.didSubmitButton()
            }))
        }else{
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                self.dismiss(animated: true)
            }))
        }
            DispatchQueue.main.async {
                self.present(alert, animated: false, completion: nil)
            } 
    }
}
