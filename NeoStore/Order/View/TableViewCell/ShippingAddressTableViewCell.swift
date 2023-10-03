//
//  ShippingAddressTableViewCell.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import UIKit

class ShippingAddressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selectionButtonImage: UIImageView!
    
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var removeBtn: UIButton!

    @IBOutlet weak var addressView: UIView!



    var removebtnClick : ((Int) -> ())?
    var selectbtnClick : (() -> ())?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        addressView.layer.shadowColor = UIColor.black.cgColor
        addressView.layer.shadowOpacity = 0.2
        addressView.layer.shadowOffset = .zero
        addressView.layer.shadowRadius = 7
        addressView.layer.cornerRadius = 6
      
    }
    
    override func prepareForReuse() {
        addressLbl.text = ""
        //selectionButtonImage.image = UIImage(named: "unchecked")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func removeBtnAction(_ sender: Any) {
        removebtnClick?(tag)
    }

    func setImage(imageName:String){
        self.selectionButtonImage.image = UIImage(named: imageName)
    }
}
