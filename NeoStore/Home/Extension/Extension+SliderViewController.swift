//
//  Extension+SliderViewController.swift
//  NeoStore
//
//  Created by neosoft on 31/08/23.
//

import Foundation
import UIKit

//protocol GetScreen{
//    func goToScreen(viewController:String,StoryBoard:String)
//}
extension SlidingViewController{
    func setProfileImage(){
        profilePicture.layer.borderWidth = 1
        profilePicture.layer.masksToBounds = false
        profilePicture.layer.borderColor = UIColor.black.cgColor
        profilePicture.layer.cornerRadius = profilePicture.frame.height/2
        profilePicture.clipsToBounds = true
    }
    func fetchAccountDetails(){
        navigationDrawerViewModel.fetchNavigationDrawerData {
            detailResponse in
            if detailResponse.status == 200{
                self.naviagtionDrawerdetails = detailResponse
                self.loadImage(detailResponse.data.userData.profilePic ?? "")
                self.userName.text = detailResponse.data.userData.username
                self.emailLbl.text = detailResponse.data.userData.email
                DispatchQueue.main.async {
                    self.navigationDrawerTableView.reloadData()
                }
            }else{
                AlertUtility.showAlert("details not found", "Something went Wrong", self)
            }
        }
    }
    
    func loadImage(_ Url:String){
        if let img = URL(string: Url) {
            URLSession.shared.dataTask(with: img) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                       
                        self.profilePicture.image = image
                    }
                }
            }.resume()
        }
    }
}

extension SlidingViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _ = naviagtionDrawerdetails else { return 0}
        return NavigationDrawerOptionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    "cell", for: indexPath) as! NavigationDrawerTableViewCell
        guard let drawerdetail = naviagtionDrawerdetails else{
            return UITableViewCell()
        }
        cell.configureCell(NavigationDrawerOptionsList[indexPath.row],
                           drawerdetail)
        cell.selectionStyle = .none
        cell.cartCountView.layer.cornerRadius = cell.cartCountView.frame.height/2
        cell.cartCountView.clipsToBounds = true
        
        if NavigationDrawerOptionsList[indexPath.row].optionlabel != "MyCart"{
            cell.cartCountView.isHidden = true
        }
        return cell
    }
    
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToHomeVc?(indexPath.row)
        self.dismiss(animated: false)
    }
}
