//
//  ProductDetailCollectionViewCell.swift
//  NeoStore
//
//  Created by neosoft on 29/08/23.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productDetailImage: UIImageView!
    
    override var isSelected: Bool {
            didSet {
                updateBorder()
            }
        }
    
    func setProductCellImage(_ productImageDetails:ProductImage){
        if let img = URL(string: productImageDetails.image) {
            URLSession.shared.dataTask(with: img) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                       
                        self.productDetailImage.image = image
                    }
                }
            }.resume()
        }
        
    }
    func updateBorder() {
            layer.borderWidth = isSelected ? 2 : 0
            layer.borderColor = isSelected ? UIColor.red.cgColor : nil
        }
}
