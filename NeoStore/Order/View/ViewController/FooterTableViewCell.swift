//
//  FooterTableViewCell.swift
//  NeoStore
//
//  Created by neosoft on 11/09/23.
//

import UIKit

class FooterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var placeOrderBtn: UIButton!
    
    var placeOrderClicked:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func placeOrder(_ sender: Any) {
       
        placeOrderClicked?()
        
    }
    
}
