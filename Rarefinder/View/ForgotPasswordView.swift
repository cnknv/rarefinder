//
//  ForgotPasswordView.swift
//  Rarefinder
//
//  Created by John KINAV on 12/31/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//


import UIKit

class ForgotPasswordView: UIViewController {
    
    
    @IBOutlet weak var emailTextView: UITextField!
    
    @IBAction func resetPassword(_ sender: Any) {
        
        AuthProvider.Instance.resetPassword(userEmail: emailTextView.text!) { (error) in
            if error != nil {
                self.alertTheUser(title: "Error", message: "Problem resetting password. Please check your email your network connection and try again", success: false )
            }
            else {
                
                self.alertTheUser(title: "Success", message: "Reset Password Email successfully sent. Please check your email box.", success: true)
            }
        }
        
        emailTextView.text! = ""
   
    }
    
    @IBAction func cancel(_ sender: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)}
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
}// class
