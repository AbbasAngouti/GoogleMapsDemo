//
//  AppDelegate.swift
//  GoogleMapsDemo
//
//  Created by Abbas Angouti on 5/19/18.
//  Copyright © 2018 Abbas Angouti. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey(Constants.API.GoogleMapsAPIKey)
        
        return true
    }

}
