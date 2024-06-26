//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Jungjin Park on 2024-06-25.
//

import Foundation
import CoreLocation
import WeatherKit

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private let weatherService = WeatherService.shared
    
    @Published var location: CLLocation?
    
//    @Published var weather: WeatherData?
//    @Published var isLoading: Bool = false
    @Published var error: Error?
//    
//    @MainActor
//    func 
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        
        
    }
    
    func requestLocatino() {
        manager.requestLocation()
    }
    
    func fetchWeather(for location: CLLocation) async {
        guard let location = self.location else {
            print("No location")
            return
        }
        do {
            let forecast = try await weatherService.weather(for: location, including: .current)
            dump(forecast)
        } catch {
            self.error = error
        }
    }
    
    // MARK: CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
        print("Locatino: \(location?.description ?? "-")")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        // TODO: Error Handling
    }
}
