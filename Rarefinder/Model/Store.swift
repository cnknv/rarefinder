//
//  Store.swift
//  Rarefinder
//
//  Created by Inan Kupeli on 5/5/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Store {
    
    let name: String
    let lat: Double
    let long: Double
    let UID: String


    // TODO: Add other properties
    
    init(_ dict: [String: Any]) {
        self.name = dict[Constants.STORE_NAME] as? String ?? ""
        self.lat = dict[Constants.STORE_LAT] as? Double ?? 0.1
        self.long = dict[Constants.STORE_LONG] as? Double ?? 0.1
        self.UID = dict[Constants.STORE_UID] as? String ?? ""
    
       
       
    }
}
