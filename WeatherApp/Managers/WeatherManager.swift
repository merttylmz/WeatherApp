//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Mert Yılmaz on 15.09.2024.
//

import Foundation
import CoreLocation
import WeatherKit


@available(iOS 16.0, *)
final class WeatherManager {
    
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    private init() {}
    
    public func getWeather(for location: CLLocation, completion: @escaping() -> Void) {
        Task {
            
            do {
                let result = try await service.weather(for: location)
                
                print("Current: \(result.currentWeather)")
                print("Hourly: \(result.hourlyForecast)")
                print("Daily: \(result.dailyForecast)")
                completion()
                
            } catch {
                print(String(describing: error))
            }
        }
    }

    
    
}
