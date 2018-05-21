//
//  ViewController.swift
//  GoogleMapsDemo
//
//  Created by Abbas Angouti on 5/19/18.
//  Copyright © 2018 Abbas Angouti. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    var mapView: GMSMapView?
    
    var locations = [GeoCodeLocation]()

    var selectedLocatoinIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initiateMapView()
    }

    
    private func initiateMapView() {
        mapView = GMSMapView(frame: CGRect.zero)
        view = mapView
        
        showLocations()
    }
    

    @objc func showLocations() {
        let zoomOnSingeLocation = selectedLocatoinIndex != -1
        let zoom: Float = zoomOnSingeLocation ? 6 : 1.2
        
        for (i, location) in locations.enumerated() {
            mapView?.camera = GMSCameraPosition.camera(withLatitude: location.geometry.location.latitude, longitude: location.geometry.location.longitude, zoom: zoom)
            
            let marker = GMSMarker()
            marker.position = location.geometry.location
            marker.title = location.formattedAddress
            marker.snippet = "(\(location.geometry.location.latitude) \(location.geometry.location.longitude))"
            marker.map = mapView
            if zoomOnSingeLocation {
                if i == selectedLocatoinIndex {
                    mapView?.selectedMarker = marker
                    mapView?.camera = GMSCameraPosition.camera(withLatitude: locations[selectedLocatoinIndex].geometry.location.latitude, longitude: locations[selectedLocatoinIndex].geometry.location.longitude, zoom: zoom)
                }
            }
            if zoomOnSingeLocation {
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.saveLocation))
            }
        }
    }
    
    @objc func saveLocation() {
        
    }
}
