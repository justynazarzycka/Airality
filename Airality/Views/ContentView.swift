//
//  ContentView.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CityAirQualityVM()
    
    
    var body: some View {

        if let airQualityData = viewModel.airQuality {
            Text(airQualityData.airQualityLevel.rawValue)
        } else {
            Text("loading")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
