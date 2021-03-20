//
//  Weather.swift
//  Airality
//
//  Created by Justyna Zarzycka on 20/03/2021.
//

import SwiftUI

struct Weather: View {
    var weather: City.WeatherData
    
    var body: some View {
        
        HStack {
            ZStack {
                RectangleBackground()
                
                VStack(alignment: .leading){
                    Text("tempeature: \(String(weather.temperature)) °")
                        .padding()
                    Text("pressure: \(String(weather.pressure)) hPa")
                        .padding()
                    Text("humidity: \(String(weather.humidity)) %")
                        .padding()
                }
            }
            ZStack {
                RectangleBackground()
                
                VStack(alignment: .leading){
                    Text("wind speed\(String(weather.windSpeed)) m/s")
                        .padding()
                    Text("wind direction\(String(weather.windDirection)) °")
                        .padding()
                }
            }
        }
        .frame(height: 230)
    }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        Weather(weather: City.testData.data.current.weather)
    }
}
