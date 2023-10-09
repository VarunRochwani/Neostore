//
//  RatePopUpViewController.swift
//  NeoStore
//
//  Created by neosoft on 07/09/23.
//

import UIKit
import Cosmos

class RatePopUpViewController: UIViewController, getRatingApiDelegate {

    @IBOutlet weak var productNameLbl: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!

    @IBOutlet weak var rateNowBtn: UIButton!
    
    @IBOutlet var removeButton: UIButton!
    
    
    @IBOutlet var ratingView: CosmosView!
    var productNameText = ""
    var productId = 0
    var productImageString = ""
    var rating:Int = 3
    
    var ratingViewModel = RatingViewModel()
    
    init(image:String,name:String,rating:Int){
        super.init(nibName: nil, bundle: nil)
        self.productNameText = name
        self.productImageString = image
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productNameLbl.text = productNameText
        self.productImage.loadImage(imgString: productImageString)
        setUpRating()
    }
    
    
    @IBAction func rateNowClicked(_ sender: Any) {
        ratingViewModel.delegate = self
        ratingViewModel.setRating(rating ,productId)
    }
    
    
    @IBAction func removeBtnAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}


extension RatePopUpViewController {
    
    func setUpRating() {
        
        ratingView.settings.filledImage = UIImage(named: "star_check")?.withRenderingMode(.alwaysOriginal)
        ratingView.settings.emptyImage = UIImage(named: "star_unchek")
        
        ratingView.settings.totalStars = 5
        ratingView.settings.fillMode = .full
        
        ratingView.didTouchCosmos = {
            rating in
            self.rating = Int(rating)
        }
    }
    
    func getRatingApiResponse(_ ratingResponse: RatingResponseModel) {
        
        AlertUtility.showAlert(ratingResponse.userMsg, ratingResponse.message, self)
    }

}
