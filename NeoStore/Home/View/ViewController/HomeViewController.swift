//
//  HomeViewController.swift
//  NeoStore
//
//  Created by apple on 09/08/23.
//

import UIKit
import NavigationDrawer

class HomeViewController: NavigationViewController {

    @IBOutlet weak var homeImageSlider: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView?
 
    @IBOutlet weak var sliderPageControl: UIPageControl!

    let homeSliderContent = HomeViewModel.silderContent()
    let productContent = HomeViewModel.productContent()
    let navigationBarUtility = NavigationBarUtility()
    
    let interactor = Interactor()

    let slidingViewController = SlidingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpPageControl()
        scrollViewDidScroll(homeImageSlider)
        configureNavigationBar()
        
        //ManageObserver()
        //hii
    }

}
