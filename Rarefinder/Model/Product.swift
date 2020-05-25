//
//  Product.swift
//  Rarefinder
//
//  Created by can kinav on 5/11/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Product {
    
    let toiletPaper: Int
    let paperTowel: Int
  

      // TODO: Add other properties
      
      init(_ dict: [String: Any]) {
        self.toiletPaper = dict[Constants.TOILET_PAPER] as? Int ?? 1
        self.paperTowel = dict[Constants.PAPER_TOWEL] as? Int ?? 1
        
    }
    
    
//    Toilet Paper
//     Paper Towel
//     Hand Sanitizer
//     Ground Beef
//     Stew Meat
//     Pork
//     Chicken Drumsticks
//     Eggs
//     Milk
//     Bleach
//     Disinfectant Wipes
//     Hand Soap
//     Pasta
//     Flour
//     Water
//     Bread

}
