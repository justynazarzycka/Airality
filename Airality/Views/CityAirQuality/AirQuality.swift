//
//  AirQuality.swift
//  Airality
//
//  Created by Justyna Zarzycka on 19/03/2021.
//

import SwiftUI


struct AirQuality: View {
    var city: City
    
    var body: some View {
        ZStack {
            RectangleBackground()
            HStack {
                
                VStack(alignment: .leading) {
                    Text(city.data.name)
                        .modifier(FitToWidth(maximumFontSize: 35))
                    Text(city.data.state)
                    Text(city.data.country)
                }
                .padding()
                .frame(width: 180, height: 230)

                
                VStack {
                    ZStack {
                        AirQualityChart(aqi: city.data.current.pollution.aqius, color: city.airQualityLevel.info.color)
                            
                        
                        VStack {
                            Text(String(city.data.current.pollution.aqius))
                                .font(.system(size: 30))
                            Text("AQI")
                        }
                    }
                    .offset(y: 15)
                    Text(city.airQualityLevel.info.description)
                        .padding()
                        .offset(y:-10)
                        .modifier(FitToWidth(maximumFontSize: 30))
                }
            }
        }
        .frame(height: 230)
    }
}

struct AirQuality_Previews: PreviewProvider {
    static var previews: some View {
        AirQuality(city: City.testData)
    }
}
