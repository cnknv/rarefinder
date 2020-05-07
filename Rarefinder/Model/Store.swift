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
    let address: String
    let lat: Double
     let long: Double
    // TODO: Add other properties
    
    init(_ dict: [String: Any]) {
        self.address = dict["store_street_address"] as? String ?? ""
        self.name = dict["store_name"] as? String ?? ""
        self.lat = dict["store_lat"] as? Double ?? 0.0
        self.long = dict["store_lon"] as? Double ?? 0.0
    }
}
