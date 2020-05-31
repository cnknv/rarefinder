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
    let handSanitizer: Int
    let groundBeef: Int
    let stewMeat: Int
    let pork: Int
    let chickenDrumsticks: Int
    let eggs: Int
    let milk: Int
    let bleach: Int
    let disinfectantWipes: Int
    let handSoap: Int
    let pasta: Int
    let flour: Int
    let water: Int
    let bread: Int
  

      // TODO: Add other properties
      
      init(_ dict: [String: Any]) {
        self.toiletPaper = dict[Constants.TOILET_PAPER] as? Int ?? 1
        self.paperTowel = dict[Constants.PAPER_TOWEL] as? Int ?? 1
        self.handSanitizer = dict[Constants.HAND_SANITIZER] as? Int ?? 1
        self.groundBeef = dict[Constants.GROUND_BEEF] as? Int ?? 1
        self.stewMeat = dict[Constants.STEW_MEAT] as? Int ?? 1
        self.pork = dict[Constants.PORK] as? Int ?? 1
        self.chickenDrumsticks = dict[Constants.CHICKEN_DRUMSTICK] as? Int ?? 1
        self.eggs = dict[Constants.EGGS] as? Int ?? 1
        self.milk = dict[Constants.MILK] as? Int ?? 1
        self.bleach = dict[Constants.BLEACH] as? Int ?? 1
        self.disinfectantWipes = dict[Constants.DISINFECTANT_WIPES] as? Int ?? 1
        self.handSoap = dict[Constants.HAND_SOAP] as? Int ?? 1
        self.pasta = dict[Constants.PASTA] as? Int ?? 1
        self.flour = dict[Constants.FLOUR] as? Int ?? 1
        self.water = dict[Constants.WATER] as? Int ?? 1
        self.bread = dict[Constants.BREAD] as? Int ?? 1
    }
}
