//
//  message.swift
//  NeoStore
//
//  Created by neosoft on 24/08/23.
//

import Foundation

struct Constant{
    static let confirmTermsMessage = "please click on check box to confirm the terms and conditions"
   
    //MARK: Title
    static let neostoreTitle = "NeoSTORE"
    static let registerTitle = "Register"
    static let myAccountTitle = "My Account"
    static let editProfileTitle = "Edit profile"
    static let resetPasswordTitle = "Reset Password"
    static let addAddressTitle = "Add Address"
    static let addressListTitle = "Address List"
    static let myOrders = "My Orders"
    static let orderDetailTitle = "Order ID: "
    static let myCartTitle = "My Cart"
    static let storeLocatorTitle = "Store Locator"
    
    //MARK: StoryBoard Names
    static let homeStoryBoard = "Home"
    static let orderStoryBoard = "Order"
    static let accountStoryBoard = "Account"
    static let mainStoryBoard = "Main"
    
    //MARK: StoryBoard Identifier
    
    static let loginVcIdentifier =  "LoginViewController"
    static let productListVcIdentifier = "ProductListViewController"
    static let myCartVcIdentifier = "MyCartViewController"
    static let myAccountVcIdentifier = "MyAccountViewController"
    static let myStoreVcIdentifier = "MyStoreViewController"
    static let orderListVcIdentifier = "OrderListViewController"
    static let productDetailVcIdentifier = "ProductDetailViewController"
    static let homeVcIdentifier = "HomeViewController"
    static let registerVcIdentifier = "RegistrationViewController"
    static let forgotPasswordVcIdentifier = "ForgotPasswordViewController"
    static let editProfileViewController = "EditProfileViewController"
    static let resetPasswordViewController = "ResetPasswordViewController"
    static let shippingAddressViewController = "ShippingAddressViewController"
    static let addressVcIdentifier = "AddressViewController"
    static let orderDetailVcIdentifier = "OrderDetailViewController"
    
    
    //MARK: UserDefault key
    static let isLoggedInKey = "isLoggedIn"
    static let accessTokenKey = "access_token"
    
    //MARK: TableViewCell
    static let productListTableViewCell = "ProductListTableViewCell"
    static let footerTableViewCell = "FooterTableViewCell"
    static let orderListTableViewCell = "OrderListTableViewCell"
    static let shippingAddressTableViewCell = "ShippingAddressTableViewCell"
    static let footerOrderDetailTableViewCell = "FooterOrderDetailTableViewCell"
    static let orderDetailTableViewCell = "OrderDetailTableViewCell"
    static let myStoreTableViewCell = "MyStoreTableViewCell"
    static let navigationDrawerTableViewCell = "NavigationDrawerTableViewCell"
    static let orderNowTableViewCell = "OrderNowTableViewCell"
    static let myCartTableViewCell = "MyCartTableViewCell"
    static let productDetailCollectionViewCell = "ProductDetailCollectionViewCell"
    
    
    //MARK: ProductCategory
    static let categoryTable = "Tables"
    static let categoryChair = "Chairs"
    static let categorySofa = "Sofa"
    static let categoryCupboard = "Cupboard"
    static let categoryTableLbl = "Category-Tables"
    static let categoryChairLbl = "Category-Chairs"
    static let categorySofaLbl = "Category-Sofa"
    static let categoryCupboardLbl = "Category-CupBoard"
    
    //MARK: Gender
    static let male = "M"
    static let female = "F"
    
    //MARK: Placeholder
    static let username = "Username"
    static let password = "Password"
    
    static let orderIdLbl = "Order ID:"
    static let orderDateLbl = "Order Date:"
    
    //MARK: NavigationDrawer options
    static let myCart = "MyCart"
    static let tables = "Tables"
    static let sofas = "Sofas"
    static let logOut = "Logout"
    static let orders = "My Orders"
    static let storeLocator = "Store Locator"
    static let myAccount = "My Account"
    static let cupboard = "Cupboard"
    static let chairs = "Chairs"
    
    //MARK: Parameter
    static let productId = "product_id"
    static let quantity = "quantity"
    static let productCategoryId = "product_category_id"
    static let rating = "rating"
    static let orderId = "order_id"
    static let email = "email"
    static let passwordParam = "password"
    
    static let urlString = "data:image/jpg;base64,"
    
}
