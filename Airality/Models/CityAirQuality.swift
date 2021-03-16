//
//  NearestCity.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import Foundation

struct CityAirQuality: Codable {
    var status: String
    var data: CityData

    struct CityData: Codable {
        var city: String
        var state: String
        var country: String
    }
    
    struct CurrentData: Codable {
        var weather: WeatherData
        var pollution: PollutionData
    }
    
    struct WeatherData: Codable {
        //var ts: String
        var tp: Int
        var pr: Int
        var hu: Int
        var ws: Int
        var wd: Int
        var ic: String
    }
    
    struct PollutionData: Codable {
        var aqius: Int
        var mainus: String
        var aqicn: Int
        var maincn: String
    }
}
