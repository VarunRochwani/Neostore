//
//  MyCartTableViewCell.swift
//  NeoStore
//
//  Created by neosoft on 05/09/23.
//

import UIKit
import iOSDropDown

class MyCartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productNameLbL: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    //@IBOutlet weak var quatityDropDown: iOSDropDown!
    
    @IBOutlet weak var quantityDropDown: DropDown!
   
    var selectionAction : ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        quantityDropDown.optionArray = ["1","2","3","4","5","6","7","8"]
        quantityDropDown.showList()
        quantityDropDown.didSelect{(selectedText , index ,id) in
            self.quantityDropDown.text = selectedText
            self.selectionAction?(selectedText)
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

   
       
        
    
    
}
