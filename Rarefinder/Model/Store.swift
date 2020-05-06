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
    // TODO: Add other properties
    
    init(using dict: [String: Any]) {
        self.name = dict["store_name"] as? String ?? ""
        self.address = dict["store_street_address"] as? String ?? ""
    }
}
