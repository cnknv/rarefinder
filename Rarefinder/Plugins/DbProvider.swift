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
    
    var userRef: DatabaseReference {
         
         return dBRef.child(Constants.USERS)
     }
     
     var userInfoRef: DatabaseReference {
         let userID = Auth.auth().currentUser?.uid
         
         return dBRef.child(Constants.USERS).child(userID!)
     }
    
  func saveUser(withID:String, Email: String, Password: String, userData: [Any]){
       
           
           let data: Dictionary  = [ Constants.EMAIL:Email, Constants.FIRST_NAME:userData[0], Constants.LAST_NAME:userData[1], Constants.PHONE_NUMBER:userData[2], Constants.USER_AGREEMENT_SIGNED:userData[3] ]
           
           userRef.child(withID).setValue(data)
           
       }
    
     var productList: [Product] = []
        func productListRetriever(withAnnotationName:String) {
           
          storeRef.queryOrdered(byChild: Constants.STORE_NAME).queryEqual(toValue: withAnnotationName).observeSingleEvent(of: .value) { (snapshot) in
                        

                      
                        let productData = snapshot.children.allObjects as? [DataSnapshot]
                        
                        for dataSnapshot in productData! {
                            guard let productDict = dataSnapshot.childSnapshot(forPath: Constants.PRODUCT_LIST).value as? [String:Any] else {
                                                     continue
                                                 }
                        

                            self.productList.append(Product(productDict))
                            
                           
                            

                                             }
            print(self.productList)
            
                 
            }
            
        
            
            
        }
    

} // class ends
