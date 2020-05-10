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
    
    
    
    

} // class ends
