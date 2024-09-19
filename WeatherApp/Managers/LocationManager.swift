//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Mert Yılmaz on 15.09.2024.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject,CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    
    static let shared = LocationManager()
    
    private var locationFetchCompletion: ((CLLocation) -> Void)?
    
    private var location: CLLocation? {
        didSet {
            guard let loc = location else {return}
            locationFetchCompletion?(loc)
        }
    }
    
    public func getCurrentLocation(completion: @escaping (CLLocation) -> Void ){
        
        self.locationFetchCompletion = completion
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    // MARK: - Location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        self.location = location
        manager.stopUpdatingLocation()
    }

}



