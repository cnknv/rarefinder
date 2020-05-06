//
//  AuthProvider.swift
//  Rarefinder
//
//  Created by can kinav on 5/4/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

typealias LoginHandler = (_ msg:String?) -> Void

struct LoginErrorCode {
    static let INVALID_EMAIL = "Invalid e-mail please enter a valid e-mail address."
    static let WRONG_PASSWORD = "Wrong password please enter correct password."
    static let PROBLEM_CONNECTING = "Database connection problem."
    static let USER_NOT_FOUND = "User not found. Please sign up."
    static let EMAIL_ALREADY_IN_USE = "This e-mail is already in use. Please use antoher e-mail address"
    static let WEAK_PASSWORD = "Password should be at least 6 characters long. "
}

class AuthProvider {
    
    private static let _instance = AuthProvider()
    static var Instance: AuthProvider {
        return _instance
        
    }
    
    
    func signUp(withEmail: String, withPassword: String, withUserData: [Any], loginHandler: LoginHandler?) {
        Auth.auth().createUser(withEmail: withEmail, password: withPassword, completion: {(user, error) in
            
            if error != nil {
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler)
                
            } else { loginHandler?(nil)
                self.sendEmail()
                self.saveWithID(withEmail: withEmail, withPassword: withPassword, withData: withUserData)
                
                
            }
        })
        
        
        
    }// signup
    
    func login(withEmail:String, withPassword:String, loginHandler:LoginHandler?) {
        
        Auth.auth().signIn(withEmail: withEmail, password: withPassword, completion: {(user, error) in
            if error != nil {
                
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler)
            } else {
                
                loginHandler?(nil)
            }
            
            
            
            
        })
        
    }
    
    func sendEmail(){
        Auth.auth().currentUser?.sendEmailVerification()
        
        
    } // send mail
    
    func changePassword(withPassword: String){
        
        Auth.auth().currentUser?.updatePassword(to: withPassword) { (error) in
            
        }
    }
    
    
    func saveWithID(withEmail: String, withPassword: String, withData: [Any] ){
//        let userID = Auth.auth().currentUser?.uid
//        Dbprovider.Instance.saveUser(withID: userID!, Email: withEmail, Password: withPassword, userData: withData)
        
        
        
    }
    
    func logOut() -> Bool{
        
        if Auth.auth().currentUser != nil  {
            
            do {
                try Auth.auth().signOut()
                return true
                
            } catch {
                
                return false
            }
        }
        return true
        
    } //log out
    
    
    
    private func handleErrors(err:NSError, loginHandler:LoginHandler?){
        
        if let errCode = AuthErrorCode(rawValue: err.code){
        
        switch errCode {
        case .emailAlreadyInUse:
            loginHandler?(LoginErrorCode.EMAIL_ALREADY_IN_USE)
            break
        case .wrongPassword:
            loginHandler?(LoginErrorCode.WRONG_PASSWORD)
            break
        case .userNotFound:
            loginHandler?(LoginErrorCode.USER_NOT_FOUND)
            break
        case .weakPassword:
            loginHandler?(LoginErrorCode.WEAK_PASSWORD)
            break
        default:
            loginHandler?(LoginErrorCode.PROBLEM_CONNECTING)
        break
            
            }
        
    }//errCode
        
    }//handleErrors func
    
    
}// AuthProvider Class
