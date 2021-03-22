//
//  Weather.swift
//  Airality
//
//  Created by Justyna Zarzycka on 20/03/2021.
//

import SwiftUI

struct Weather: View {
    var weather: Station.WeatherData
    
    var body: some View {
        
        HStack {
            ZStack {
                RectangleBackground()
                
                VStack(alignment: .leading){
                    weatherRow(imageName: "thermometer", text: "\(String(weather.temperature)) °C")
                        
                    weatherRow(imageName: "pressure-gauge", text: "\(String(weather.pressure)) hPa")
                    
                    weatherRow(imageName: "humidity", text: "\(String(weather.humidity)) %")
                }
            }
            ZStack {
                RectangleBackground()
                
                VStack(alignment: .leading){
                    Image(String(weather.icon))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .offset(x: 30, y: 10)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    weatherRow(imageName: "wind", text: "\(String(weather.windSpeed)) m/s")
                    
                    weatherRow(imageName: "arrow",imageRotation: -Double(weather.windDirection + 45), text: "\(String(weather.windDirection)) °")
                }
            }
        }
        .frame(height: 230) 
    }
}

struct weatherRow: View {
    var imageName: String
    var imageRotation: Double = 0
    var text: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .rotationEffect(.degrees(imageRotation))
            Text(text)
                
        }.padding()
    }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        Weather(weather: Station.testData.data.current.weather)
    }
}
