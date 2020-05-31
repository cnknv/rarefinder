//
//  UserAgreementViewController.swift
//  Rarefinder
//
//  Created by can kinav on 5/31/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import UIKit

class UserAgreementViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func doneButton(_ sender: UIStoryboardSegue){
        dismiss(animated: true, completion: nil) }
    
//    @IBAction func doneButton(_ sender: UIStoryboardSegue){
//    dismiss(animated: true, completion: nil) }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
