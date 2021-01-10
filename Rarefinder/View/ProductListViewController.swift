//
//  ProductListViewController.swift
//  Rarefinder
//
//  Created by can kinav on 5/11/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase

class MyCustomTableviewCell: UITableViewCell {
    
    

    var storeID : String = ""
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCount: UILabel!
    @IBAction func lowStock(_ sender: Any) {
        let count:Int = Int(productCount.text!)!
        if Int(productCount.text!)! > 0 {
            productCount.text = String(Int(productCount.text!)! - 1 )
            Dbprovider.Instance.productListSaver(withStoreUID: storeID, withProductName: productName.text!, withProductCount: count)
        }
        
        
        
     
       
    }
    
    @IBAction func productAvailable(_ sender: Any) {
        productCount.text = String(Int(productCount.text!)! + 1)
        let count:Int = Int(productCount.text!)!
        Dbprovider.Instance.productListSaver(withStoreUID: storeID, withProductName: productName.text!, withProductCount: count)

        
    }
    

    @IBAction func outOfStock(_ sender: Any) {
        productCount.text = String(0)
        Dbprovider.Instance.productListSaver(withStoreUID: storeID, withProductName: productName.text!, withProductCount: 0)
    
    }
    


} // MyCustomTableviewCell





class ProductListViewController: UITableViewController {

    
    
    var navTitle = " "
    var latitude  = Double()
    var storeProductList: [Product] = []
    var storeID : String = ""
    

    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBAction func doneButton(_ sender: Any) {
        
       
        
    }
    

    var labels  = [String]()
    
     var counts  = [Int]()
    var productListAll : Dictionary <String, Int> = [ "Bleach" : 0,
                                                     "Bread" : 0,
                                                     "Chicken Drumsticks" : 0,
                                                     "Disinfectant Wipes" : 0,
                                                     "Eggs" : 0,
                                                     "Flour" : 0,
                                                     "Ground Beef" : 0,
                                                     "Hand Sanitizer" : 0,
                                                     "Hand Soap" : 0,
                                                     "Milk" : 0,
                                                     "Paper Towel" : 0,
                                                     "Pasta" : 0,
                                                     "Pork" : 0,
                                                     "Stew Meat" : 0,
                                                     "Toilet Paper" : 0,
                                                     "Water" : 0]
    @IBAction func backButton(_ sender: Any) {
        
         dismiss(animated: true, completion: nil)
    }
    
    

    
    func productListRetriever(withStoreUID:String) {
        
        
        labels = Array(productListAll.keys)
             counts = Array(productListAll.values)
    
      
        Dbprovider.Instance.productRef.child(withStoreUID).observeSingleEvent(of: .value) { [self] (snapshot) in
           
          
           
            if let productData = snapshot.children.allObjects as? [DataSnapshot]{
                for dataSnapshot in productData {
                    guard let productDict = dataSnapshot.value as? [String:Int] else {
                                             continue
                        
                                         }
                    
                    let dict = productListAll.merging(productDict) { (_, new) in new }
                


                    self.labels = Array(dict.keys)
                    self.counts = Array(dict.values)
                    self.tableView.reloadData()
                   
                 
                                     }
                
            }
            }
       

        }
    
    
    func productListSaver(withProductName: String, withProductCount:Int){
 
 
        Dbprovider.Instance.productRef.child(storeID).child(Constants.PRODUCT_LIST).child(withProductName).setValue(withProductCount)
       
 
 
     }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = navTitle


    productListRetriever(withStoreUID: storeID)
        
     
  
       
        
        
       

  

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        // #warning Incomplete implementation, return the number of rows
        return labels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MyCustomTableviewCell
        cell.storeID = storeID
     
     
        cell.productName?.text =  labels[indexPath.row]
        cell.productCount?.text = String(counts[indexPath.row])

        return cell
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
