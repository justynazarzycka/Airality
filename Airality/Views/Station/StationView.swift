//
//  CityAirQualityView.swift
//  Airality
//
//  Created by Justyna Zarzycka on 17/03/2021.
//

import SwiftUI

struct StationView: View {
    @StateObject var viewModel = StationVM()
    
    
    var body: some View {

        if let stationData = viewModel.stationData {
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("  Closest station:")
                        .foregroundColor(.gray)
                    AirQuality(station: stationData)
                    
                    
                    Spacer()
                        .frame(height: 25)
                    
                    
                    Text("  Weather:")
                        .foregroundColor(.gray)
                    Weather(weather: stationData.data.current.weather)
                    
                    
                    Spacer()
                        .frame(height: 25)
                    
                    
                    Text("  On map")
                        .foregroundColor(.gray)
                    CityMapView(stationCoordinates: stationData.data.location)
                }
                .padding()
            }
        }
        
        else {
            Text("loading")
        }
    }
}

struct CityAirQualityView_Previews: PreviewProvider {
    
    static var previews: some View {
        StationView()
    }
}

