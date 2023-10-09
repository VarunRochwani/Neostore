//
//  MyStoreViewController.swift
//  NeoStore
//
//  Created by neosoft on 14/09/23.
//

import UIKit
import MapKit

class MyStoreViewController: UIViewController {

    
    @IBOutlet weak var storeMapView: MKMapView!
    @IBOutlet weak var storeLocationTableView: UITableView!
    
    let storeLocationList = StoreLocationViewModel.getStoreList()
    
    let navigationBarUtility = NavigationBarUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnnotationforStoreLocation(0)
        storeLocationTableView.tableFooterView = UIView()
        setUpNavBar()
    }
}
extension MyStoreViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        StoreLocationViewModel.getStoreListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.myStoreTableViewCell, for: indexPath) as! MyStoreTableViewCell
        
        cell.storeNameLbl.text = storeLocationList[indexPath.row].storeName
        cell.storeAddressLbl.text = storeLocationList[indexPath.row].storeAddress
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.setAnnotationforStoreLocation(indexPath.row)
    }
    
    func setAnnotationforStoreLocation(_ index:Int){
        
            let annotation = MKPointAnnotation()
            annotation.title = storeLocationList[index].storeName
            annotation.coordinate = CLLocationCoordinate2D(latitude: storeLocationList[index].latitude, longitude:storeLocationList[index].longitude)
            storeMapView.addAnnotation(annotation)
            let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters:1000)
            storeMapView.setRegion(region, animated: true)

    }
    
    func setUpNavBar(){
        navigationBarUtility.setTitle(Constant.storeLocatorTitle, self)
        navigationBarUtility.configureRightBarButton(image:Images.searchIcon,style:.plain,target:self,action:nil,vc: self)
        navigationBarUtility.configureLeftBarButton(image: Images.leftBackButton, style: .plain, target: self, action: #selector(leftButtonClick), vc: self)
    }

    @objc func leftButtonClick(){
        self.navigationController?.popViewController(animated: true)
    }
 
}
