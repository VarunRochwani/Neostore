//
//  OrderListTableViewCell.swift
//  NeoStore
//
//  Created by neosoft on 04/09/23.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var orderIdLbl: UILabel!
    @IBOutlet weak var separatorLbl: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var orderAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
