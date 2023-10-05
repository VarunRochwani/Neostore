//
//  SlidingViewController.swift
//  NeoStore
//
//  Created by neosoft on 30/08/23.
//

import UIKit
import NavigationDrawer

class SlidingViewController: UIViewController {

    
    var interactor:Interactor? = nil
    
    var navigateToHomeVc: ((Int) ->())?

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var navigationDrawerTableView: UITableView!
    
    let navigationDrawerViewModel = NavigationDrawerViewModel()
    let NavigationDrawerOptionsList = NavigationDrawerViewModel.getOptionList()
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        setProfileImage()
        fetchAccountDetails()
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
    dismiss(animated: false, completion: nil)
    }

}
