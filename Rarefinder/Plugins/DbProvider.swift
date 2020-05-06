//
//  DbProvider.swift
//  Rarefinder
//
//  Created by can kinav on 5/5/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import Foundation
import Firebase
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
    
    
    
    

} // class ends
