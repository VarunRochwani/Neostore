//
//  ProductListTableViewCell.swift
//  NeoStore
//
//  Created by neosoft on 25/08/23.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLbl:UILabel!
    @IBOutlet weak var producerLbl:UILabel!
    @IBOutlet weak var cost:UILabel!
   
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(_ productListData:ProductData){
       
        productNameLbl.text = productListData.name
        
        producerLbl.text = productListData.producer
        cost.text = "Rs.\(productListData.cost ?? 0)"
  
        if let img = URL(string: productListData.productImages ?? "") {
            URLSession.shared.dataTask(with: img) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                       
                        self.productImage.image = image
                    }
                }
            }.resume()
        }
    }
    func setRating(_ rating:Int){
        resetRating()
        switch rating{
            
        case 1:
            star1.image = UIImage(named: Images.checkedStar)
            break
        
        case 2:
            star1.image = UIImage(named: Images.checkedStar)
            star2.image = UIImage(named: Images.checkedStar)
            break
            
        case 3:
            star1.image = UIImage(named: Images.checkedStar)
            star2.image = UIImage(named: Images.checkedStar)
            star3.image = UIImage(named: Images.checkedStar)
            break
            
        case 4:
            star1.image = UIImage(named: Images.checkedStar)
            star2.image = UIImage(named: Images.checkedStar)
            star3.image = UIImage(named: Images.checkedStar)
            star4.image = UIImage(named: Images.checkedStar)
            break
            
        case 5:
            star1.image = UIImage(named: Images.checkedStar)
            star2.image = UIImage(named: Images.checkedStar)
            star3.image = UIImage(named: Images.checkedStar)
            star4.image = UIImage(named: Images.checkedStar)
            star5.image = UIImage(named: Images.checkedStar)
            break
        default:
            break
        }
    }
    func resetRating(){
        star1.image = UIImage(named: Images.unncheckedStar)
        star2.image = UIImage(named: Images.unncheckedStar)
        star3.image = UIImage(named: Images.unncheckedStar)
        star4.image = UIImage(named: Images.unncheckedStar)
        star5.image = UIImage(named: Images.unncheckedStar)
    }
    
}
