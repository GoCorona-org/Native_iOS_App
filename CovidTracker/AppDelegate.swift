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
import Firebase
import FirebaseAuth
import FacebookLogin
import FBSDKLoginKit
import FacebookCore
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let googleApiKey = "AIzaSyCdAZxrKF_HsR22v6BBm6Ry8IrUFgtZunc"
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey(googleApiKey)
        GMSPlacesClient.provideAPIKey(googleApiKey)
        setIdentifiers()
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = "140038051654-u0ulhrnfj3pvh7lqmtf5tkoc8a0fmm20.apps.googleusercontent.com"        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
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

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        DispatchQueue.main.async {
            if (url.scheme == "linkedinCallbackURI"){
                print("Im here!!!")
            }
        }
        
         ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        return true
    }
//        return GIDSignIn.sharedInstance().handle(url)
//    }

//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
//              withError error: Error!) {
//      if let error = error {
//        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
//          print("The user has not signed in before or they have since signed out.")
//        } else {
//          print("\(error.localizedDescription)")
//        }
//        return
//      }
//      // Perform any operations on signed in user here.
//      let userId = user.userID                  // For client-side use only!
//      let idToken = user.authentication.idToken // Safe to send to the server
//      let fullName = user.profile.name
//      let givenName = user.profile.givenName
//      let familyName = user.profile.familyName
//      let email = user.profile.email
//      // ...
//    }
//
//    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
//              withError error: Error!) {
//      // Perform any operations when the user disconnects from app here.
//      // ...
//    }
}

