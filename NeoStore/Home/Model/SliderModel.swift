//
//  SliderModel.swift
//  NeoStore
//
//  Created by neosoft on 25/08/23.
//

import Foundation
import UIKit

struct HomeSliderModel{
    var HomesilderContent:[CollectionViewContent] = []
    
    init () {
        setHomeContent()
    }
    mutating func setHomeContent(){
        
        let sliderContent1 = CollectionViewContent(contentImage: UIImage(named: Images.sliderImage1)!,contentId: 0)
        HomesilderContent.append(sliderContent1)
        
        let sliderContent2 = CollectionViewContent(contentImage: UIImage(named: Images.sliderImage2)!,contentId: 1)
        HomesilderContent.append(sliderContent2)
        
        let sliderContent3 = CollectionViewContent(contentImage: UIImage(named: Images.sliderImage3)!,contentId: 2)
        HomesilderContent.append(sliderContent3)
        
        let sliderContent4 = CollectionViewContent(contentImage: UIImage(named: Images.sliderImage4)!,contentId: 3)
        HomesilderContent.append(sliderContent4)
    }
    
    func getHomeSliderContent() -> [CollectionViewContent]{
        return HomesilderContent
    }
}


