//
//  ViewController.swift
//  GoogleMapsDemo
//
//  Created by Abbas Angouti on 5/19/18.
//  Copyright © 2018 Abbas Angouti. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    var mapView: GMSMapView?
    
    var currentDestination: VacationDestination?
    var currentDestIndex = 0
    
    let destinations = [VacationDestination(name: "Embarcadero Bart Station", location: CLLocationCoordinate2DMake(37.792905, -122.397059), zoom: 14),
                        VacationDestination(name: "Ferry Building", location: CLLocationCoordinate2DMake(37.795434, -122.39473), zoom: 18),
                        VacationDestination(name: "Coit Tower", location: CLLocationCoordinate2DMake(37.802378, -122.405811), zoom: 15),
                        VacationDestination(name: "Fisherman's Wharf", location: CLLocationCoordinate2DMake(37.808, -122.417743), zoom: 15),
                        VacationDestination(name: "Golden Gate Bridge", location: CLLocationCoordinate2DMake(37.807664, -122.475069), zoom: 13)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initiateMapView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.nextSite))
    }

    private func initiateMapView() {
        mapView = GMSMapView(frame: CGRect.zero)
        view = mapView
        
        nextSite()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    
    @objc func nextSite() {
        let nextDestination = destinations[currentDestIndex % destinations.count]
        mapView?.camera = GMSCameraPosition.camera(withLatitude: nextDestination.location.latitude, longitude: nextDestination.location.longitude, zoom: nextDestination.zoom)
        let marker = GMSMarker()
        marker.position = nextDestination.location
        marker.title = nextDestination.name
        marker.map = mapView
        
        currentDestIndex += 1
    }

}

class  VacationDestination {
    let name: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    init(name: String, location: CLLocationCoordinate2D, zoom: Float) {
        self.name = name
        self.location = location
        self.zoom = zoom
    }
}
