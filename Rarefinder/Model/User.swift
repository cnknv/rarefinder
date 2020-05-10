//
//  User.swift
//  Rarefinder
//
//  Created by can kinav on 5/9/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct User {
    
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    // TODO: Add other properties
    
    init(_ dict: [String: Any]) {
        self.firstName = dict[Constants.FIRST_NAME] as? String ?? ""
        self.lastName = dict[Constants.LAST_NAME] as? String ?? ""
        self.phone = dict[Constants.PHONE_NUMBER] as? String ?? ""
        self.email = dict[Constants.EMAIL] as? String ?? ""
    }
}
