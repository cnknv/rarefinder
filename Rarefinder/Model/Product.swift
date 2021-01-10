//
//  Product.swift
//  Rarefinder
//
//  Created by can kinav on 5/12/20.
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
        self.toiletPaper = dict[Constants.TOILET_PAPER] as? Int ?? 0
        self.paperTowel = dict[Constants.PAPER_TOWEL] as? Int ?? 0
        self.handSanitizer = dict[Constants.HAND_SANITIZER] as? Int ?? 0
        self.groundBeef = dict[Constants.GROUND_BEEF] as? Int ?? 0
        self.stewMeat = dict[Constants.STEW_MEAT] as? Int ?? 0
        self.pork = dict[Constants.PORK] as? Int ?? 0
        self.chickenDrumsticks = dict[Constants.CHICKEN_DRUMSTICK] as? Int ?? 0
        self.eggs = dict[Constants.EGGS] as? Int ?? 0
        self.milk = dict[Constants.MILK] as? Int ?? 0
        self.bleach = dict[Constants.BLEACH] as? Int ?? 0
        self.disinfectantWipes = dict[Constants.DISINFECTANT_WIPES] as? Int ?? 0
        self.handSoap = dict[Constants.HAND_SOAP] as? Int ?? 0
        self.pasta = dict[Constants.PASTA] as? Int ?? 0
        self.flour = dict[Constants.FLOUR] as? Int ?? 0
        self.water = dict[Constants.WATER] as? Int ?? 0
        self.bread = dict[Constants.BREAD] as? Int ?? 0
    }
}
