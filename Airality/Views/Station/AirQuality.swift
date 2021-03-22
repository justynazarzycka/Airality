//
//  AirQuality.swift
//  Airality
//
//  Created by Justyna Zarzycka on 19/03/2021.
//

import SwiftUI


struct AirQuality: View {
    var station: Station
    
    var body: some View {
        ZStack {
            RectangleBackground()
            HStack {
                
                VStack(alignment: .leading) {
                    Text(station.data.name)
                        .modifier(FitToWidth(maximumFontSize: 35))
                    Text(station.data.state)
                    Text(station.data.country)
                }
                .padding()
                .frame(width: 180, height: 230)

                
                VStack {
                    ZStack {
                        AirQualityChart(aqi: station.data.current.pollution.aqius, color: station.airQualityLevel.info.color)
                            
                        
                        VStack {
                            Text(String(station.data.current.pollution.aqius))
                                .font(.system(size: 30))
                            Text("AQI")
                        }
                    }
                    .offset(y: 15)
                    Text(station.airQualityLevel.info.description)
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
        AirQuality(station: Station.testData)
    }
}
