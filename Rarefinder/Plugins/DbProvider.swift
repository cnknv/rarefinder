//
//  DbProvider.swift
//  Rarefinder
//
//  Created by can kinav on 5/5/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase


class Dbprovider {
private static let _instance = Dbprovider()
static var Instance: Dbprovider {
    return _instance
    
}
    
    
    var dBRef: DatabaseReference {
         
         return Database.database().reference()
     }
    

    var storeRef: DatabaseReference {
        return dBRef.child(Constants.STOREZ)
        
    }
    
    var productRef: DatabaseReference {
        return dBRef.child(Constants.PRODUCTS)
         
     }
    
    var userRef: DatabaseReference {
         
         return dBRef.child(Constants.USERS)
     }
     
     var userInfoRef: DatabaseReference {
         let userID = Auth.auth().currentUser?.uid
         
         return dBRef.child(Constants.USERS).child(userID!)
     }
    
  func saveUser(withID:String, Email: String, Password: String, userData: [Any]){
       
           
           let data: Dictionary  = [ Constants.EMAIL:Email, Constants.FIRST_NAME:userData[0], Constants.LAST_NAME:userData[1], Constants.PHONE_NUMBER:userData[2] ]
           
           userRef.child(withID).setValue(data)
           
       }
    
    func productListSaver(withStoreUID: String, withProductName: String, withProductCount:Int){

        
      productRef.child(withStoreUID).child(Constants.PRODUCT_LIST).child(withProductName).setValue(withProductCount)
      

    }
    
//    func productListAdder(withStoreUID: String, productData:Dictionary<String, Int>){
//
//
//        productRef.child(withStoreUID).child(Constants.PRODUCT_LIST).setValue(productData)
//
//
//    }
    
    
    

    

    

    
   
    

} // class ends
