//
//  LoginViewController.swift
//  Rarefinder
//
//  Created by can kinav on 5/4/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var emailField: UITextField!
   
    
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func login(_ sender: Any) {
        login()
    }
    
    @IBAction func cancel(_ sender: UIStoryboardSegue){
    dismiss(animated: true, completion: nil) }
    
     private let LOGIN_SEGUE = "loginsegue"
    
        func login() {
            if emailField.text != nil && passwordField.text != nil {

                
                AuthProvider.Instance.login(withEmail: emailField.text!, withPassword: passwordField.text!, loginHandler: { (message) in
                    if message != nil {
                        self.alertTheUser(title: "Problem with authentication", message: message!)
                    } else {
                       
                        
                        self.performSegue(withIdentifier: self.LOGIN_SEGUE, sender: nil)

                        
                    }
                })
            }
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func alertTheUser(title:String, message:String){
 
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}


