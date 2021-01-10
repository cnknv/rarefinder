//
//  SecondViewController.swift
//  Rarefinder
//
//  Created by can kinav on 5/3/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import UIKit
import FirebaseAuth

class SecondViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    private let LOGOUT_SEGUE = "logout_segue"
    
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBAction func changePassword(_ sender: Any) {
        
        AuthProvider.Instance.changePassword(currentPassword: oldPasswordTextField.text! , newPassword: newPasswordTextField.text!) { (error) in
            if error != nil {
                self.alertTheUser(title: "Error", message: "Problem changing password. Please create a stronger password, check your old password and check your network connection and try again")
            }
            else {
                self.alertTheUser(title: "Success", message: "Password changed successfully.")
            }
        }
        
        oldPasswordTextField.text! = ""
        newPasswordTextField.text! = ""
    }
        
  
    @IBAction func helpButton(_ sender: Any) {
    }
    @IBAction func logOutButton(_ sender: Any) {
        
      
        
        AuthProvider.Instance.logOut()
        
       
        
            performSegue(withIdentifier: self.LOGOUT_SEGUE, sender: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newPasswordTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    private func alertTheUser(title:String, message:String){
 
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


}

