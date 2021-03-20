//
//  CityAirQualityView.swift
//  Airality
//
//  Created by Justyna Zarzycka on 17/03/2021.
//

import SwiftUI

struct CityView: View {
    @StateObject var viewModel = CityVM()
    
    
    var body: some View {

        if let cityData = viewModel.cityData {
            VStack {
                Text("Closest station:")
                AirQuality(city: cityData)
                    .padding()
                
                Text("Weather:")
                Weather(weather: cityData.data.current.weather)
                    .padding()
            }
        } else {
            Text("loading")
        }
    }
}

struct CityAirQualityView_Previews: PreviewProvider {
    
    static var previews: some View {
        CityView()
    }
}

