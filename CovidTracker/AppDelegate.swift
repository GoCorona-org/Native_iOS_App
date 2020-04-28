//
//  AppDelegate.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/10.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let googleApiKey = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey(googleApiKey)
        GMSPlacesClient.provideAPIKey(googleApiKey)
        setIdentifiers()
        return true
    }
    
    private func setIdentifiers() {
        if let _userUUID = UserDefaults.standard.string(forKey: "USER_UUID"), let _intersectionUUID = UserDefaults.standard.string(forKey: "INTERSECTION_UUID"), let _medicalUUID = UserDefaults.standard.string(forKey: "MEDICAL_UUID") {
            userUUID = _userUUID
            intersectionUUID = _intersectionUUID
            medicalUUID = _medicalUUID
        } else {
            let _userUUID = UUID().uuidString
            UserDefaults.standard.set(_userUUID, forKey: "USER_UUID")
            let _intersectionUUID = UUID().uuidString
            UserDefaults.standard.set(_intersectionUUID, forKey: "INTERSECTION_UUID")
            let _medicalUUID = UUID().uuidString
            UserDefaults.standard.set(_medicalUUID, forKey: "MEDICAL_UUID")
            userUUID = _userUUID
            intersectionUUID = _intersectionUUID
            medicalUUID = _medicalUUID
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

