//
//  MapViewController.swift
//  Rarefinder
//
//  Created by can kinav on 5/3/20.
//  Copyright © 2020 John Kinav. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

final class MapViewController: UIViewController, CLLocationManagerDelegate {
     private let PRODUCT_LIST_SEGUE = "productlistsegue"
    

    @IBOutlet weak var mapView: MKMapView!
    
     var locManager = CLLocationManager()
   
    func myLoc(){
         
          
      }
    
    
     
    
    func storeAdder() {
       
        
  Dbprovider.Instance.storeRef.observeSingleEvent(of: .value) { (snapshot) in
         
         if let result = snapshot.children.allObjects as? [DataSnapshot] {
             
          
             //store data comes baby
             var storeList: [Store] = []
             for dataSnapshot in result {
                 guard let dict = dataSnapshot.value as? [String: Any] else {
                     continue
                 }
              storeList.append(Store(dict))
             }
                 for store in storeList {
            
                                   let latitude: CLLocationDegrees = store.lat
                                   let longitude: CLLocationDegrees = store.long
                                   let subtitle = store.address
                                   let name = store.name
                                   let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                                   let storeAnn = MyAnnotation(title: name, coordinate: location, subtitle: subtitle)
                                   self.mapView.addAnnotation(storeAnn)
                               }

    
         }
 }
 
        
    } // storeAdder
    
                
       
   
 

    override func viewDidLoad() {
        super.viewDidLoad()
      
//      myLoc()
        
        storeAdder()
       locManager.startUpdatingLocation()
  
  locManager.delegate = self
           locManager.desiredAccuracy = kCLLocationAccuracyBest
           locManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}


class MyAnnotation: NSObject, MKAnnotation {
    
    var title : String?
    var subtitle: String?
    var coordinate : CLLocationCoordinate2D
    
    init(title:String, coordinate:CLLocationCoordinate2D, subtitle:String){
        
        self.title = title;
        self.coordinate = coordinate;
        self.subtitle = subtitle;
        
        
    }
    
}

extension MapViewController: MKMapViewDelegate {
    

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "marker"
        var view = MKMarkerAnnotationView()
        
if annotation is MKUserLocation { return nil }
        
else {  view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
    view.canShowCallout = true
    view.calloutOffset = CGPoint(x: -5, y: 5)
   
    
    let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                            size: CGSize(width: 30, height: 30)))
    mapsButton.setBackgroundImage(UIImage(named: "Map-icon"), for: UIControl.State())
    view.rightCalloutAccessoryView = mapsButton
   
    
    view.markerTintColor = UIColor(displayP3Red: 255/255, green: 4/255, blue: 158/255, alpha: 1)

    
        }
        

        return view
    }
    

    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
          let location = view.annotation?.coordinate

        let placemark = MKPlacemark(coordinate: location!, addressDictionary:nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = (view.annotation?.title)!
        
        performSegue(withIdentifier: self.PRODUCT_LIST_SEGUE , sender: nil)
       
      
        
        
        

        
        
    }
    


}
