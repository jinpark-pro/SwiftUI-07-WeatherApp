//
//  File.swift
//  WeatherApp
//
//  Created by Jungjin Park on 2024-06-25.
//

import Foundation

struct WeatherData: Codable {
    let temperature: Double
    let description: String
    let humidity: Double
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature, description, humidity, windSpeed
    }
}
