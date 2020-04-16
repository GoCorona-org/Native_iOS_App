//
//  HomeViewController.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/11.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import NVActivityIndicatorView


class HomeViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    private let locationManager = CLLocationManager()
    private var mapView: GMSMapView!
    private var placesClient: GMSPlacesClient!
    
    let sampleCoords: [CLLocationCoordinate2D] = [CLLocationCoordinate2D(latitude: 35.68, longitude: 139.86), CLLocationCoordinate2D(latitude: 35.680529, longitude: 139.868503), CLLocationCoordinate2D(latitude: 35.683248, longitude: 139.868197), CLLocationCoordinate2D(latitude: 35.683631, longitude: 139.866750), CLLocationCoordinate2D(latitude: 35.682594, longitude: 139.865612)]
    
    override func viewDidLoad() {
        
        let camera = GMSCameraPosition.camera(withLatitude: 35.68, longitude: 139.86, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: UIScreen.main.bounds, camera: camera)
        view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 35.689487, longitude: 139.691711)
        marker.title = "Tokyo"
        marker.snippet = "Japan"
        marker.map = mapView
        placesClient = GMSPlacesClient.shared()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        let navView = createNavView()
        if let menuButton = navView.subviews.first(where: {$0 is UIButton}) as? UIButton {
            menuButton.addTarget(self, action: #selector(sideMenuPressed(sender:)), for: .touchUpInside)
        }
        view.addSubview(navView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        /*navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xE72E68)
        navigationController?.navigationBar.topItem?.title = "SPOT CORONA"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 20) ?? UIFont.systemFont(ofSize: 20)]*/
        addMarkersToMap(coordinates: sampleCoords)
    }
    
    @objc func sideMenuPressed(sender: UIButton) {
        print("Side menu pressed.")
    }
    
    func addMarkersToMap(coordinates: [CLLocationCoordinate2D]) {
        for  (index, coordinate) in coordinates.enumerated() {
            let marker = GMSMarker(position: coordinate)
            marker.iconView = index % 2 == 0 ? createHeatMapView(color: UIColor(rgb: 0xB79E8A)) : createHeatMapView(color: UIColor(rgb: 0xE03D51))
            //marker.icon = index % 2 == 0 ? UIImage(named: "brownmapmarker") : UIImage(named: "redmapmarker")
            marker.map = mapView
        }
    }
    
    func createHeatMapView(color: UIColor) -> UIView {
        let indicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 64, height: 64), type: .ballScaleMultiple, color: color, padding: 0)
        indicator.startAnimating()
        return indicator
    }
}
// MARK: - CLLocationManagerDelegate
extension HomeViewController: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    guard status == .authorizedWhenInUse else {
      return
    }
    locationManager.startUpdatingLocation()
    
    mapView.isMyLocationEnabled = true
    mapView.settings.myLocationButton = true
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }
    
    mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
    
    locationManager.stopUpdatingLocation()
  }
}
