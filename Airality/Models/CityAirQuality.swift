//
//  NearestCity.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import Foundation

struct CityAirQuality: Codable {
    var status: String
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
        var city: String
        var current: CurrentData
    }
    
    struct currentData: Codable {
        var weather: WeatherData
        var pollution: PollutionData
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
        
        enum CodingKeys: String, CodingKey {
            case temperature = "tp"
            case pressure = "pr"
            case humidity = "hu"
            case windSpeed = "ws"
            case windDirection = "wd"
        }
    }
    
    struct PollutionData: Codable {
        var aqius: Int
        var mainus: String
        var aqicn: Int
        var maincn: String
    }
    
    // levels based on www.airnow.gov
    enum AirQualityLevel: String {
        case good = "Good"
        case moderate = "Moderate"
        case unhealthyForSensitiveGroups = "Unhealthy for Sensitive Groups"
        case unhealthy = "Unhealthy"
        case veryUnhealthy = "Very Unhealty"
        case hazardous = "Hazardous"
        case unknown
    }
}
