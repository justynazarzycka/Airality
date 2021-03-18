//
//  CityAirQualityView.swift
//  Airality
//
//  Created by Justyna Zarzycka on 17/03/2021.
//

import SwiftUI

struct CityAirQualityView: View {
    @StateObject var viewModel = CityAirQualityVM()
    
    
    var body: some View {

        if let cityData = viewModel.cityData {
            VStack {
                
                Text(cityData.airQualityLevel.rawValue)
            }
        } else {
            Text("loading")
        }
    }
}

struct CityAirQualityView_Previews: PreviewProvider {
    
    static var previews: some View {
        CityAirQualityView()
    }
}

