//
//  OrderDetailTableViewCell.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(_ url:String){
        if let img = URL(string: url) {
            URLSession.shared.dataTask(with: img) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                       
                        self.productImage.image = image
                    }
                }
            }.resume()
        }
    }

}
