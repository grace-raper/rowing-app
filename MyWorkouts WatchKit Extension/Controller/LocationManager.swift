//
//  LocationManager.swift
//  MyWorkouts WatchKit App
//
//  Created by Grace Raper on 4/7/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Request permission to use location services
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        // Configure the location manager
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10.0 // In meters

        // Start location updates
        locationManager.startUpdatingLocation()
    }

    // MARK: - CLLocationManagerDelegate methods

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Handle new location data
        guard let location = locations.last else { return }
        print("New location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle location update errors
        print("Location update failed with error: \(error.localizedDescription)")
    }

}
