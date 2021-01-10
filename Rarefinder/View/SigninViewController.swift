//
//  SigninViewController.swift
//  Rarefinder
//
//  Created by can kinav on 5/4/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SigninViewController: UIViewController {
    
    @IBOutlet weak var checkMark: Checkmark!
    @IBAction func cancel(_ sender: UIStoryboardSegue){
        dismiss(animated: true, completion: nil) }
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func signIn(_ sender: Any) {
        
        let userData : [Any] = [firstNameField.text!, lastNameField.text!, phoneNumberField.text! ]
               
               if emailField.text != nil && passwordField.text != nil {

                   AuthProvider.Instance.signUp(withEmail: emailField.text!, withPassword: passwordField.text!, withUserData: userData, loginHandler:  { (message) in
                       if message != nil {
                           
                           self.alertTheUser(title: "User Creating Problem", message: message!, success: false)
                       } else {
                           self.alertTheUser(title: "E-mail Verification", message: "Verification e-mail has been sent your e-mail address", success: true )
                           
                       }
                   })
                   
          
               }
               
               else {
         alertTheUser(title: "E-mail and password Required", message: "Please enter your e-mail and password", success:false )

               }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
    
    private func alertTheUser(title: String, message:String, success:Bool){
        
        if success == true {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: {action in self.dismiss(animated: true, completion: nil)})
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
