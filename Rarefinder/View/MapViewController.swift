//
//  FirstViewController.swift
//  Rarefinder
//
//  Created by can kinav on 5/3/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    

    @IBOutlet weak var mapView: MKMapView!
    
     var locManager = CLLocationManager()
   
    func myLoc(){
         
          
      }
 

    override func viewDidLoad() {
        super.viewDidLoad()
      
//      myLoc()
       locManager.startUpdatingLocation()
  
  locManager.delegate = self
           locManager.desiredAccuracy = kCLLocationAccuracyBest
           locManager.requestWhenInUseAuthorization()
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         let location = locations.last
         
         let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075)
         let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude)
         let region: MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
         
         
         mapView.setRegion(region, animated: true)
         self.mapView.showsUserLocation = true
                 locManager.stopUpdatingLocation()
         
     }
     
    
  


}

