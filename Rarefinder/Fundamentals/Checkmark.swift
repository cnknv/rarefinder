//
//  Checkmark.swift
//  Rarefinder
//
//  Created by can kinav on 5/4/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import UIKit

class Checkmark:UIButton {
    let checkedImage = UIImage(named: "checked")
    let unCheckedImage = UIImage(named: "unchecked")
    
     @IBInspectable var isChecked: Bool = false{
        
        didSet{
            
            self.updateImage()
        }
        
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(Checkmark.buttonClicked), for: UIControl.Event.touchUpInside)
        self.updateImage()
    }
    
  
    func updateImage(){
        
        if isChecked == true {
            self.setImage(checkedImage, for: [])
        } else {
            
            self.setImage(unCheckedImage, for: [])
        }
        
    }
    
    @objc func buttonClicked(sender: UIButton){
        
        if(sender == self){
            isChecked = !isChecked
        }
    }
    
    
}// class



