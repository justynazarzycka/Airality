//
//  NearestCity.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import Foundation
import SwiftUI

struct City: Codable {
    //var status: String
    var data: Data
    var airQualityLevel: AirQualityLevel {
        switch data.current.pollution.aqius {
        case 0...50:
            return AirQualityLevel.good
        case 51...100:
            return AirQualityLevel.moderate
        case 101...150:
            return AirQualityLevel.unhealthyForSensitiveGroups
        case 151...200:
            return AirQualityLevel.unhealthy
        case 201...300:
            return AirQualityLevel.veryUnhealthy
        case 301...Int.max:
            return AirQualityLevel.hazardous
        default:
            return AirQualityLevel.unknown
        }
    }
    
    struct Data: Codable {
        var name: String
        var state: String
        var country: String
        var location: Location
        var current: CurrentData
        
        enum CodingKeys: String, CodingKey {
            case name = "city"
            case state, country, location, current
        }
    }
    
    struct Location: Codable {
        var type: String
        var coordinates: [Double]
    }
    
    struct CurrentData: Codable {
        var weather: WeatherData
        var pollution: PollutionData
    }
    
    struct WeatherData: Codable {
        var temperature: Int
        var pressure: Int
        var humidity: Int
        var windSpeed: Double
        var windDirection: Int
        var icon: String
        
        enum CodingKeys: String, CodingKey {
            case temperature = "tp"
            case pressure = "pr"
            case humidity = "hu"
            case windSpeed = "ws"
            case windDirection = "wd"
            case icon = "ic"
        }
    }
    
    struct PollutionData: Codable {
        var aqius: Int //AQI value based on US EPA standard
    }
    
    // levels based on www.airnow.gov
    enum AirQualityLevel {
        case good
        case moderate
        case unhealthyForSensitiveGroups
        case unhealthy
        case veryUnhealthy
        case hazardous
        case unknown
        
        var info: (description: String, color: Color) {
            switch self {
            case .good:
                return ("Good", .green)
            case .moderate:
                return ("Moderate", .yellow)
            case .unhealthyForSensitiveGroups:
                return ("Unhealthy for Sensitive Groups", .orange)
            case .unhealthy:
                return ("Unhealthy", .red)
            case .veryUnhealthy:
                return ("Very Unhealty", .purple)
            case .hazardous:
                return ("Hazardous", Color("Maroon"))
            default:
                return ("", .gray)
            }
        }
    }
}
