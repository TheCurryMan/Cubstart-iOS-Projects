//
//  ViewController.swift
//  Junkies
//
//  Created by Avinash Jain on 10/13/20.
//  Copyright © 2020 Avinash Jain. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locateUser()
    }
    
    func locateUser() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0]
        
        let coordinates = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        mapView.setRegion(region, animated: true)
        
//        locationManager.stopUpdatingLocation()
        findNearestRestaurant(userLocation: userLocation, name: "chipotle")
    }
    
    func findNearestRestaurant(userLocation: CLLocation, name: String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = name
        
        searchRequest.region = self.mapView.region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start{ (response, error) in
            guard let response = response else {
                print("we had an error finding any restaurant")
                return
            }
            
            print(response.mapItems.count)
            
            var finalPlace = response.mapItems[0]
            var distance = CLLocationDistance(exactly: 1000000.0)
            
            for place in response.mapItems {
                
                let placemarkLocation = CLLocation(latitude: place.placemark.coordinate.latitude, longitude: place.placemark.coordinate.longitude)
                
                if (userLocation.distance(from: placemarkLocation) < distance!) {
                    finalPlace = place
                    distance = userLocation.distance(from: placemarkLocation)
                }
            }
            
            self.addAnnotation(mapItem: finalPlace)
        }
    }
    
    func addAnnotation(mapItem: MKMapItem) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.name
        self.mapView.addAnnotation(annotation)
    }
}

