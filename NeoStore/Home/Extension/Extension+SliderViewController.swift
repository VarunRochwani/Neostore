//
//  Extension+SliderViewController.swift
//  NeoStore
//
//  Created by neosoft on 31/08/23.
//

import Foundation
import UIKit


extension SlidingViewController{
    func setProfileImage(){
        profilePicture.layer.borderWidth = 1
        profilePicture.layer.masksToBounds = false
        profilePicture.layer.borderColor = UIColor.black.cgColor
        profilePicture.layer.cornerRadius = profilePicture.frame.height/2
        profilePicture.clipsToBounds = true
    }
    func fetchAccountDetails(){
        navigationDrawerViewModel.fetchNavigationDrawerData { [self] in
            profilePicture.loadImage(imgString: navigationDrawerViewModel.getProfilePic())
            self.userName.text = navigationDrawerViewModel.getUserName()
                    self.emailLbl.text = navigationDrawerViewModel.getEmail()
                    DispatchQueue.main.async {
                        self.navigationDrawerTableView.reloadData()
                }
        }
        
        }
}

extension SlidingViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _ = navigationDrawerViewModel.naviagtionDrawerdetails else { return 0}
        return NavigationDrawerOptionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    Constant.navigationDrawerTableViewCell, for: indexPath) as! NavigationDrawerTableViewCell
        guard let drawerdetail = navigationDrawerViewModel.naviagtionDrawerdetails else{
            return UITableViewCell()
        }
        cell.configureCell(NavigationDrawerOptionsList[indexPath.row],
                           drawerdetail)
        cell.selectionStyle = .none
        cell.cartCountView.layer.cornerRadius = cell.cartCountView.frame.height/2
        cell.cartCountView.clipsToBounds = true
        
        if NavigationDrawerOptionsList[indexPath.row].optionlabel != Constant.myCart{
            cell.cartCountView.isHidden = true
        }
        return cell
    }
    
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToHomeVc?(NavigationDrawerOptionsList[indexPath.row].OptionId)
        self.dismiss(animated: false)
    }
}
