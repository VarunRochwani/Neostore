//
//  NavigationDrawerTableViewCell.swift
//  NeoStore
//
//  Created by neosoft on 31/08/23.
//

import UIKit

class NavigationDrawerTableViewCell: UITableViewCell {

    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var optionLbl: UILabel!
    
    @IBOutlet weak var cartCountView: UIView!
    
    @IBOutlet weak var cartCount: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ option:Option,_ naviagtionDrawerdetails:NavigationDrawerModel){
        optionImage.image = option.optionImage
        optionLbl.text=option.optionlabel
        cartCount.text = "\(naviagtionDrawerdetails.data.totalCarts )"
    }

}
