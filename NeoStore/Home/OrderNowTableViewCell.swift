//
//  OrderNowTableViewCell.swift
//  NeoStore
//
//  Created by neosoft on 13/09/23.
//

import UIKit

class OrderNowTableViewCell: UITableViewCell {

    
    @IBOutlet weak var totalAmt: UILabel!
    
    @IBOutlet weak var orderNowBtn: UIButton!
    
    var orderNowClick:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func orderNowAction(_ sender: Any) {
        orderNowClick?()
    }
    
}
