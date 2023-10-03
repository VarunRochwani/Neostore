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
        
        var sliderContent1 = CollectionViewContent(contentImage: UIImage(named: Images.sliderImage1)!,contentId: 0)
        HomesilderContent.append(sliderContent1)
        
        var sliderContent2 = CollectionViewContent(contentImage: UIImage(named: Images.sliderImage2)!,contentId: 1)
        HomesilderContent.append(sliderContent2)
        
        var sliderContent3 = CollectionViewContent(contentImage: UIImage(named: Images.sliderImage3)!,contentId: 2)
        HomesilderContent.append(sliderContent3)
        
        var sliderContent4 = CollectionViewContent(contentImage: UIImage(named: Images.sliderImage4)!,contentId: 3)
        HomesilderContent.append(sliderContent4)
    }
    
    func getHomeSliderContent() -> [CollectionViewContent]{
        return HomesilderContent
    }
}


