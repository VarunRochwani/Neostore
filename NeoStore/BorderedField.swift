//
//  BorderedField.swift
//  NeoStore
//
//  Created by apple on 08/08/23.
//

import UIKit

class BorderedField: UIView {

    required init?(coder: NSCoder) {
           super.init(coder: coder)
           setUpUI()
       }
     func setUpUI() {
            layer.borderWidth = 2.0
            layer.borderColor = UIColor.white.cgColor
        }
    
    

}
